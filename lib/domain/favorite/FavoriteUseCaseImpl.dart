import 'package:technical_test/domain/favorite/FavoriteRepository.dart';
import 'package:technical_test/domain/favorite/FavoriteUseCase.dart';
import 'package:technical_test/domain/favorite/model/FavoriteDomainModel.dart';
import 'package:technical_test/utils/RequestState.dart';

class FavoriteUseCaseImpl implements FavoriteUseCase {
  final FavoriteRepository repository;

  FavoriteUseCaseImpl(this.repository);

  @override
  Future<RequestState<void>> addToFavorite(FavoriteDomainModel coffee) {
    return repository.addToFavorite(coffee);
  }

  @override
  Future<RequestState<bool>> isFavorite(int id) {
    return repository.isFavorite(id);
  }

  @override
  Future<RequestState<void>> removeFromFavorite(int id) {
    return repository.removeFromFavorite(id);
  }

  @override
  Future<RequestState<List<FavoriteDomainModel>>> getListFavorite() {
    return repository.getListFavorite();
  }
}
