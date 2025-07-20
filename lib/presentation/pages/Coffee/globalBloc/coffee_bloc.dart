import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:technical_test/domain/coffee/CoffeeUseCase.dart';
import 'package:technical_test/domain/coffee/model/CoffeeDomainModel.dart';

import '../../../../utils/RequestState.dart';

part 'coffee_event.dart';
part 'coffee_state.dart';

class CoffeeBloc extends Bloc<CoffeeEvent, CoffeeState> {
  final CoffeeUseCase useCase;
  final ScrollController scrollController = ScrollController();

  CoffeeBloc(this.useCase) : super(CoffeeState.initial()) {
    on<FetchCoffeeHot>(_onFetchCoffeeHot);
    on<FetchCoffeeIce>(_onFetchCoffeeIce);
  }

  Future<void> _onFetchCoffeeHot(
    FetchCoffeeHot event,
    Emitter<CoffeeState> emit,
  ) async {
    emit(state.copyWith(coffeeHotState: RequestState.loading()));

    final result = await useCase.getAllCoffeeHot();

    emit(state.copyWith(coffeeHotState: result));
  }

  Future<void> _onFetchCoffeeIce(
    FetchCoffeeIce event,
    Emitter<CoffeeState> emit,
  ) async {
    emit(state.copyWith(coffeeIceState: RequestState.loading()));

    final result = await useCase.getAllCoffeeIce();

    emit(state.copyWith(coffeeIceState: result));
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
