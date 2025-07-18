part of 'coffee_bloc.dart';

// sealed class CoffeeState extends Equatable {
//   const CoffeeState();
// }
//
// final class CoffeeInitial extends CoffeeState {
//   @override
//   List<Object> get props => [];
// }

class CoffeeState {
  final RequestState<List<CoffeeDomainModel>> coffeeHotState;
  final RequestState<List<CoffeeDomainModel>> coffeeIceState;

  const CoffeeState({
    required this.coffeeHotState,
    required this.coffeeIceState,
  });

  factory CoffeeState.initial() {
    return const CoffeeState(
      coffeeHotState: RequestState.idle(),
      coffeeIceState: RequestState.idle(),
    );
  }

  CoffeeState copyWith({
    RequestState<List<CoffeeDomainModel>>? coffeeHotState,
    RequestState<List<CoffeeDomainModel>>? coffeeIceState,
  }) {
    return CoffeeState(
      coffeeHotState: coffeeHotState ?? this.coffeeHotState,
      coffeeIceState: coffeeIceState ?? this.coffeeIceState,
    );
  }
}
