import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technical_test/presentation/pages/Coffee/hot/CoffeeHotScreen.dart';
import 'package:technical_test/presentation/pages/Coffee/ice/CoffeeIceScreen.dart';
import 'package:technical_test/presentation/pages/Home/BottomNavBarItemModel.dart';

class HomeState {
  final int selectedIndex;

  const HomeState({this.selectedIndex = 0});

  HomeState copyWith({int? selectedIndex}) {
    return HomeState(selectedIndex: selectedIndex ?? this.selectedIndex);
  }
}

class HomeController extends Notifier<HomeState> {
  @override
  HomeState build() {
    return const HomeState();
  }

  void onItemTapped(int index) {
    state = state.copyWith(selectedIndex: index);
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
  ];

  String get appBarTitle => bottomNavBarItems[state.selectedIndex].appBarText;

  Widget get currentScreen => bottomNavBarItems[state.selectedIndex].screen;

  List<BottomNavBarItemModel> get items => bottomNavBarItems;
}

final homeControllerProvider = NotifierProvider<HomeController, HomeState>(() {
  return HomeController();
});
