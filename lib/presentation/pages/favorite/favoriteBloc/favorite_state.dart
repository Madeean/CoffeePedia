part of 'favorite_bloc.dart';

class FavoriteState {
  final RequestState<List<FavoriteDomainModel>> favoriteState;
  final bool isFavorite;

  const FavoriteState({required this.favoriteState, required this.isFavorite});

  factory FavoriteState.initial() {
    return const FavoriteState(
      favoriteState: RequestState.idle(),
      isFavorite: false,
    );
  }

  FavoriteState copyWith({
    RequestState<List<FavoriteDomainModel>>? favoriteState,
    bool? isFavorite,
  }) {
    return FavoriteState(
      favoriteState: favoriteState ?? this.favoriteState,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
