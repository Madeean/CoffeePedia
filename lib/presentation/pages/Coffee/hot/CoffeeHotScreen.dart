import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technical_test/domain/model/CoffeeDomainModel.dart';
import 'package:technical_test/presentation/navigations/RoutePage.dart';
import 'package:technical_test/presentation/themes/Colors.dart';
import 'package:technical_test/presentation/widgets/CoffeeCard.dart';
import 'package:technical_test/utils/RequestState.dart';

import 'CoffeeHotController.dart';

class CoffeeHotScreen extends ConsumerStatefulWidget {
  const CoffeeHotScreen({super.key});

  @override
  ConsumerState<CoffeeHotScreen> createState() => _CoffeeHotScreenState();
}

class _CoffeeHotScreenState extends ConsumerState<CoffeeHotScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(
      coffeeControllerProvider.select((s) => s.dataCoffeeHotState),
    );
    final controller = ref.read(coffeeControllerProvider.notifier);

    return Container(
      color: CustomColors.lightGrey,
      padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                controller.fetchAllCoffeeHot();
              },
              child: _buildBody(state, controller),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(
    RequestState<List<CoffeeDomainModel>> state,
    CoffeeHotController controller,
  ) {
    return state.when(
      idle: () => const Center(child: Text("Please Swipe down to refresh")),
      loading: () => const Center(child: CircularProgressIndicator()),
      success: (data) {
        if (data.isEmpty) {
          return const Center(child: Text("Coffee Hot Not Found"));
        }

        return GridView.builder(
          controller: controller.scrollC,
          padding: const EdgeInsets.only(bottom: 12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 15,
            childAspectRatio: 0.75,
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {
            final coffee = data[index];
            return CoffeeCard(
              coffee: coffee,
              navigation: () {
                Navigator.pushNamed(
                  context,
                  RoutePage.detail.path,
                  arguments: coffee,
                );
              },
            );
          },
        );
      },
      error:
          (msg) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text("Coffee Hot Not Found Please refresh")),
          SizedBox(height: 8,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: CustomColors.blue,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              controller.fetchAllCoffeeHot();
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: Text(
                "Refresh",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: CustomColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
