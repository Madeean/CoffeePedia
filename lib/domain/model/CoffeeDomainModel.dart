import 'package:freezed_annotation/freezed_annotation.dart';

part 'CoffeeDomainModel.freezed.dart';

@freezed
class CoffeeDomainModel with _$CoffeeHotDomainModel {
  const factory CoffeeDomainModel({
    required String title,
    required String description,
    required List<String> ingredients,
    required String image,
    required int id,
  }) = _CoffeeHotDomainModel;
}