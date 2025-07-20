import 'package:technical_test/domain/favorite/model/FavoriteDomainModel.dart';
import 'package:technical_test/utils/RequestState.dart';

abstract class FavoriteRepository {
  Future<RequestState<void>> addToFavorite(FavoriteDomainModel coffee);

  Future<RequestState<void>> removeFromFavorite(int id);

  Future<RequestState<List<FavoriteDomainModel>>> getListFavorite();

  Future<RequestState<bool>> isFavorite(int id);
}
