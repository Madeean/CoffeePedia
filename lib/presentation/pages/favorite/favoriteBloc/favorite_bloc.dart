import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:technical_test/domain/favorite/FavoriteUseCase.dart';
import 'package:technical_test/domain/favorite/model/FavoriteDomainModel.dart';
import 'package:technical_test/utils/RequestState.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteUseCase useCase;
  final ScrollController scrollController = ScrollController();

  FavoriteBloc(this.useCase) : super(FavoriteState.initial()) {
    on<AddFavorite>(_onAddFavorite);

    // on<RemoveFavoriteEvent>((event, emit) async {
    //   emit(FavoriteLoading());
    //   final result = await useCase.removeFromFavorite(event.id);
    //   result.when(
    //     idle: () {},
    //     loading: () {},
    //     success: (_) => emit(FavoriteRemoved()),
    //     error: (e) => emit(FavoriteError(e.toString())),
    //   );
    // });
    //
    on<CheckFavorite>(_onCheckFavorite);

    on<GetListFavorite>(_onGetListFavorite);
  }

  Future<void> _onGetListFavorite(
    GetListFavorite event,
    Emitter<FavoriteState> emit,
  ) async {
    emit(state.copyWith(favoriteState: RequestState.loading()));

    final result = await useCase.getListFavorite();
    emit(state.copyWith(favoriteState: result));
  }

  Future<void> _onAddFavorite(
    AddFavorite event,
    Emitter<FavoriteState> emit,
  ) async {
    await useCase.addToFavorite(event.coffee);
    add(CheckFavorite(event.coffee.id));
  }

  Future<void> _onCheckFavorite(
    CheckFavorite event,
    Emitter<FavoriteState> emit,
  ) async {
    final result = await useCase.isFavorite(event.id);
    final isFavorite = result.dataOrNull ?? false;
    emit(state.copyWith(isFavorite: isFavorite));
  }
}
