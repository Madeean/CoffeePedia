import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test/domain/favorite/model/FavoriteDomainModel.dart';
import 'package:technical_test/presentation/navigations/RoutePage.dart';
import 'package:technical_test/presentation/pages/favorite/favoriteBloc/favorite_bloc.dart';
import 'package:technical_test/presentation/widgets/CoffeeCard.dart';
import 'package:technical_test/utils/RequestState.dart';

import '../../themes/Colors.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late FavoriteBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<FavoriteBloc>();
    bloc.add(GetListFavorite());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        return Container(
          color: CustomColors.lightGrey,
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {},
                  child: _buildBody(context, state.favoriteState, bloc),
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
    RequestState<List<FavoriteDomainModel>> state,
    FavoriteBloc bloc,
  ) {
    return state.when(
      idle: () => const Center(child: Text("Favorite is empty")),
      loading: () => const Center(child: CircularProgressIndicator()),
      success: (data) {
        if (data.isEmpty) {
          return const Center(child: Text("Favorite is empty"));
        }

        return GridView.builder(
          controller: bloc.scrollController,
          padding: const EdgeInsets.only(bottom: 12, top: 12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 15,
            childAspectRatio: 0.75,
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {
            final coffee = data[index].toCoffee();
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
              Center(child: Text("Favorite error")),
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
                  bloc.add(GetListFavorite());
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
