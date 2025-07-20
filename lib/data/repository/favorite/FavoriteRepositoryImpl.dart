import 'package:hive_ce/hive.dart';
import 'package:technical_test/domain/favorite/FavoriteRepository.dart';
import 'package:technical_test/domain/favorite/model/FavoriteDomainModel.dart';
import 'package:technical_test/utils/RequestState.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  static const boxName = 'favorite_coffees';

  Future<Box<FavoriteDomainModel>> _box() {
    return Hive.openBox<FavoriteDomainModel>(boxName);
  }

  @override
  Future<RequestState<void>> addToFavorite(FavoriteDomainModel coffee) async {
    try {
      final box = await _box();
      await box.put(coffee.id, coffee);
      return RequestState.success(null);
    } catch (e) {
      return RequestState.error(e.toString());
    }
  }

  @override
  Future<RequestState<bool>> isFavorite(int id) async {
    try {
      final box = await _box();
      final isFavorite = box.containsKey(id);
      return RequestState.success(isFavorite);
    } catch (e) {
      return RequestState.success(false);
    }
  }

  @override
  Future<RequestState<void>> removeFromFavorite(int id) async {
    try {
      final box = await _box();
      await box.delete(id);
      return RequestState.success(null);
    } catch (e) {
      return RequestState.error(e.toString());
    }
  }

  @override
  Future<RequestState<List<FavoriteDomainModel>>> getListFavorite() async {
    try {
      final box = await _box();
      return RequestState.success(box.values.toList());
    } catch (e) {
      return RequestState.error([]);
    }
  }
}
