part of 'home_bloc.dart';

// @immutable
// sealed class HomeEvent {}

abstract class HomeEvent {}

class HomeItemTapped extends HomeEvent {
  final int index;
  HomeItemTapped(this.index);
}
