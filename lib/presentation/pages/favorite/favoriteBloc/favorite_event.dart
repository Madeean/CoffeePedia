part of 'favorite_bloc.dart';

sealed class FavoriteEvent {}

class AddFavorite extends FavoriteEvent {
  final FavoriteDomainModel coffee;
  AddFavorite(this.coffee);
}

class RemoveFavorite extends FavoriteEvent {
  final int id;
  RemoveFavorite(this.id);
}

class CheckFavorite extends FavoriteEvent {
  final int id;
  CheckFavorite(this.id);
}

class GetListFavorite extends FavoriteEvent {}