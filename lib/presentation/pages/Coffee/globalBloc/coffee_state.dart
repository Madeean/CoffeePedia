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
  final RequestState<List<CoffeeDomainModel>> coffeeState;

  const CoffeeState({required this.coffeeState});

  factory CoffeeState.initial() {
    return const CoffeeState(coffeeState: RequestState.idle());
  }

  CoffeeState copyWith({
    RequestState<List<CoffeeDomainModel>>? coffeeState,
  }) {
    return CoffeeState(
      coffeeState: coffeeState ?? this.coffeeState,
    );
  }
}