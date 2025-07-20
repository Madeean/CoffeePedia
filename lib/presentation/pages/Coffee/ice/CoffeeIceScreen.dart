import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test/domain/coffee/model/CoffeeDomainModel.dart';
import 'package:technical_test/presentation/navigations/RoutePage.dart';
import 'package:technical_test/presentation/pages/Coffee/globalBloc/coffee_bloc.dart';
import 'package:technical_test/presentation/themes/Colors.dart';
import 'package:technical_test/presentation/widgets/CoffeeCard.dart';
import 'package:technical_test/utils/RequestState.dart';

class CoffeeIceScreen extends StatefulWidget {
  const CoffeeIceScreen({super.key});

  @override
  State<CoffeeIceScreen> createState() => _CoffeeIceScreenState();
}

class _CoffeeIceScreenState extends State<CoffeeIceScreen> {
  late CoffeeBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<CoffeeBloc>();
    if (bloc.state.coffeeIceState.isIdle) {
      bloc.add(FetchCoffeeIce());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffeeBloc, CoffeeState>(
      builder: (context, state) {
        return Container(
          color: CustomColors.lightGrey,
          padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    bloc.add(FetchCoffeeIce());
                  },
                  child: _buildBody(context, state.coffeeIceState, bloc),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBody(
    BuildContext context,
    RequestState<List<CoffeeDomainModel>> state,
    CoffeeBloc bloc,
  ) {
    return state.when(
      idle: () => const Center(child: Text("Please Swipe down to refresh")),
      loading: () => const Center(child: CircularProgressIndicator()),
      success: (data) {
        if (data.isEmpty) {
          return const Center(child: Text("Coffee Ice Not Found"));
        }

        return GridView.builder(
          controller: bloc.scrollController,
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
              Center(child: Text("Coffee Ice Not Found Please refresh")),
              SizedBox(height: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.blue,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  bloc.add(FetchCoffeeIce());
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
