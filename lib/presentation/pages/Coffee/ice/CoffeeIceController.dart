import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technical_test/di/Injection.dart';
import 'package:technical_test/domain/CoffeeUseCase.dart';
import 'package:technical_test/domain/model/CoffeeDomainModel.dart';
import 'package:technical_test/utils/RequestState.dart';

class CoffeeIceControllerState {
  final RequestState<List<CoffeeDomainModel>> dataCoffeeState;

  CoffeeIceControllerState({required this.dataCoffeeState});

  factory CoffeeIceControllerState.initial() {
    return CoffeeIceControllerState(
      dataCoffeeState: const RequestState.idle(),
    );
  }

  CoffeeIceControllerState copyWith({
    RequestState<List<CoffeeDomainModel>>? dataCoffeeState,
  }) {
    return CoffeeIceControllerState(
      dataCoffeeState: dataCoffeeState ?? this.dataCoffeeState,
    );
  }
}

class CoffeeIceController extends StateNotifier<CoffeeIceControllerState> {
  final ScrollController scrollController = ScrollController();
  final CoffeeUseCase _useCase;

  CoffeeIceController(this._useCase)
    : super(CoffeeIceControllerState.initial()) {
    Future.microtask(() {
      fetchAllCoffee();
    });
  }

  Future<void> fetchAllCoffee() async {
    state = state.copyWith(dataCoffeeState: RequestState.loading());
    final result = await _useCase.getAllCoffeeIce();
    state = state.copyWith(dataCoffeeState: result);
  }

  ScrollController get scrollC => scrollController;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}

final coffeeControllerProvider =
    StateNotifierProvider<CoffeeIceController, CoffeeIceControllerState>((ref) {
      final useCase = sl<CoffeeUseCase>();
      final controller = CoffeeIceController(useCase);

      ref.onDispose(() {
        controller.dispose();
      });

      return controller;
    });
