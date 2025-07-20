import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:technical_test/domain/coffee/model/CoffeeDomainModel.dart';

part 'CoffeeResponse.freezed.dart';

@freezed
class CoffeeHotResponse with _$CoffeeHotResponse {
  const factory CoffeeHotResponse({
    int? id,
    String? title,
    List<String>? ingredients,
    String? image,
    String? description,
  }) = _CoffeeHotResponse;

  factory CoffeeHotResponse.fromJson(Map<String, dynamic> json) {
    final rawIngredients = json['ingredients'];
    List<String> parsedIngredients;

    if (rawIngredients is String) {
      parsedIngredients = rawIngredients
          .split(',')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();
    } else if (rawIngredients is List) {
      parsedIngredients = rawIngredients
          .map((e) => e.toString().trim())
          .where((e) => e.isNotEmpty)
          .toList();
    } else {
      parsedIngredients = [];
    }

    return CoffeeHotResponse(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      ingredients: parsedIngredients,
    );
  }
}

extension CoffeeHotListMapper on List<CoffeeHotResponse> {
  List<CoffeeDomainModel> toDomainList() {
    return map((e) => e.toDomain()).toList();
  }
}

extension CoffeeHotMapper on CoffeeHotResponse {
  CoffeeDomainModel toDomain() {
    return CoffeeDomainModel(
      id: id ?? 0,
      description: description ?? '',
      image: image ?? '',
      ingredients: ingredients ?? [],
      title: title ?? '',
    );
  }
}
