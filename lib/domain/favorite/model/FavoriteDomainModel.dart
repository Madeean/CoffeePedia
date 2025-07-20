import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:technical_test/domain/coffee/model/CoffeeDomainModel.dart';

part 'FavoriteDomainModel.freezed.dart';
part 'FavoriteDomainModel.g.dart';

@freezed
class FavoriteDomainModel with _$FavoriteDomainModel {
  const factory FavoriteDomainModel({
    required String title,
    required String description,
    required List<String> ingredients,
    required String image,
    required int id,
  }) = _FavoriteDomainModel;

  factory FavoriteDomainModel.fromCoffee(CoffeeDomainModel domain) =>
      FavoriteDomainModel(
        title: domain.title,
        description: domain.description,
        ingredients: domain.ingredients,
        image: domain.image,
        id: domain.id,
      );

  factory FavoriteDomainModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteDomainModelFromJson(json);
}

extension FavoriteDomainModelX on FavoriteDomainModel {
  CoffeeDomainModel toCoffee() => CoffeeDomainModel(
    title: title,
    description: description,
    ingredients: ingredients,
    image: image,
    id: id,
  );
}
