part of 'home_bloc.dart';

class HomeState {
  final int selectedIndex;

  const HomeState({this.selectedIndex = 0});

  HomeState copyWith({int? selectedIndex}) {
    return HomeState(selectedIndex: selectedIndex ?? this.selectedIndex);
  }
}
//
// final class HomeInitial extends HomeState {}
