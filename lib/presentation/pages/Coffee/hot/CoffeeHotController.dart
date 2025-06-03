import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technical_test/di/Injection.dart';
import 'package:technical_test/domain/CoffeeUseCase.dart';
import 'package:technical_test/domain/model/CoffeeDomainModel.dart';
import 'package:technical_test/utils/RequestState.dart';

class CoffeeHotControllerState {
  final RequestState<List<CoffeeDomainModel>> dataCoffeeHotState;

  CoffeeHotControllerState({required this.dataCoffeeHotState});

  factory CoffeeHotControllerState.initial() {
    return CoffeeHotControllerState(
      dataCoffeeHotState: const RequestState.idle(),
    );
  }

  CoffeeHotControllerState copyWith({
    RequestState<List<CoffeeDomainModel>>? dataCoffeeHotState,
  }) {
    return CoffeeHotControllerState(
      dataCoffeeHotState: dataCoffeeHotState ?? this.dataCoffeeHotState,
    );
  }
}

class CoffeeHotController extends StateNotifier<CoffeeHotControllerState> {
  final ScrollController scrollController = ScrollController();
  final CoffeeUseCase _useCase;

  CoffeeHotController(this._useCase)
    : super(CoffeeHotControllerState.initial()) {
    Future.microtask(() {
      fetchAllCoffeeHot();
    });
  }

  Future<void> fetchAllCoffeeHot() async {
    state = state.copyWith(dataCoffeeHotState: RequestState.loading());

    final result = await _useCase.getAllCoffeeHot();

    state = state.copyWith(dataCoffeeHotState: result);
  }

  ScrollController get scrollC => scrollController;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}

final coffeeControllerProvider =
    StateNotifierProvider<CoffeeHotController, CoffeeHotControllerState>((ref) {
      final useCase = sl<CoffeeUseCase>();
      final controller = CoffeeHotController(useCase);

      ref.onDispose(() {
        controller.dispose();
      });

      return controller;
    });
