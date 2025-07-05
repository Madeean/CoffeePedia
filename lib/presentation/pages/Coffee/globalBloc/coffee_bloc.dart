import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../../domain/CoffeeUseCase.dart';
import '../../../../domain/model/CoffeeDomainModel.dart';
import '../../../../utils/RequestState.dart';

part 'coffee_event.dart';
part 'coffee_state.dart';

class CoffeeBloc extends Bloc<CoffeeEvent, CoffeeState> {
  final CoffeeUseCase useCase;
  final bool isCoffeeHot;
  final ScrollController scrollController = ScrollController();

  CoffeeBloc(this.useCase, this.isCoffeeHot) : super(CoffeeState.initial()) {
    // on<CoffeeEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    on<FetchCoffeeHot>(_onFetchCoffeeHot);
    on<FetchCoffeeIce>(_onFetchCoffeeIce);

    if (isCoffeeHot) {
      add(FetchCoffeeHot());
    } else {
      add(FetchCoffeeIce());
    }
  }

  Future<void> _onFetchCoffeeHot(
    FetchCoffeeHot event,
    Emitter<CoffeeState> emit,
  ) async {
    emit(state.copyWith(coffeeState: RequestState.loading()));

    final result = await useCase.getAllCoffeeHot();

    emit(state.copyWith(coffeeState: result));
  }

  Future<void> _onFetchCoffeeIce(
    FetchCoffeeIce event,
    Emitter<CoffeeState> emit,
  ) async {
    emit(state.copyWith(coffeeState: RequestState.loading()));

    final result = await useCase.getAllCoffeeIce();

    emit(state.copyWith(coffeeState: result));
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
