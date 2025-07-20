// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class FavoriteDomainModelAdapter extends TypeAdapter<FavoriteDomainModel> {
  @override
  final typeId = 0;

  @override
  FavoriteDomainModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteDomainModel(
      title: fields[0] as String,
      description: fields[1] as String,
      ingredients: (fields[2] as List).cast<String>(),
      image: fields[3] as String,
      id: (fields[4] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteDomainModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.ingredients)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteDomainModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
