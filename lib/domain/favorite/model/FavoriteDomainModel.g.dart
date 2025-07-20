// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FavoriteDomainModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavoriteDomainModelImpl _$$FavoriteDomainModelImplFromJson(
  Map<String, dynamic> json,
) => _$FavoriteDomainModelImpl(
  title: json['title'] as String,
  description: json['description'] as String,
  ingredients:
      (json['ingredients'] as List<dynamic>).map((e) => e as String).toList(),
  image: json['image'] as String,
  id: (json['id'] as num).toInt(),
);

Map<String, dynamic> _$$FavoriteDomainModelImplToJson(
  _$FavoriteDomainModelImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'ingredients': instance.ingredients,
  'image': instance.image,
  'id': instance.id,
};
