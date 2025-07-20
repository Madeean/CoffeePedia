import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:technical_test/presentation/pages/favorite/FavoriteScreen.dart';

import '../../Coffee/hot/CoffeeHotScreen.dart';
import '../../Coffee/ice/CoffeeIceScreen.dart';
import '../BottomNavBarItemModel.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<HomeItemTapped>((event, emit) {
      emit(state.copyWith(selectedIndex: event.index));
    });
  }

  final bottomNavBarItems = [
    const BottomNavBarItemModel(
      screen: CoffeeHotScreen(),
      appBarText: "Coffee Hot",
      icon: Icons.home,
      label: 'Hot',
    ),
    const BottomNavBarItemModel(
      screen: CoffeeIceScreen(),
      appBarText: "Coffee Ice",
      icon: Icons.person,
      label: 'Ice',
    ),
    const BottomNavBarItemModel(
      screen: FavoriteScreen(),
      appBarText: "Favorite Coffee",
      icon: Icons.favorite,
      label: 'Favorite',
    ),
  ];

  String getAppBarTitle(int index) => bottomNavBarItems[index].appBarText;

  Widget getScreen(int index) => bottomNavBarItems[index].screen;

  List<BottomNavBarItemModel> get items => bottomNavBarItems;
}
