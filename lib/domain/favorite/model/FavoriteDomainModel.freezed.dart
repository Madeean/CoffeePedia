// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'FavoriteDomainModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FavoriteDomainModel _$FavoriteDomainModelFromJson(Map<String, dynamic> json) {
  return _FavoriteDomainModel.fromJson(json);
}

/// @nodoc
mixin _$FavoriteDomainModel {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get ingredients => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  /// Serializes this FavoriteDomainModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FavoriteDomainModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FavoriteDomainModelCopyWith<FavoriteDomainModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteDomainModelCopyWith<$Res> {
  factory $FavoriteDomainModelCopyWith(
    FavoriteDomainModel value,
    $Res Function(FavoriteDomainModel) then,
  ) = _$FavoriteDomainModelCopyWithImpl<$Res, FavoriteDomainModel>;
  @useResult
  $Res call({
    String title,
    String description,
    List<String> ingredients,
    String image,
    int id,
  });
}

/// @nodoc
class _$FavoriteDomainModelCopyWithImpl<$Res, $Val extends FavoriteDomainModel>
    implements $FavoriteDomainModelCopyWith<$Res> {
  _$FavoriteDomainModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavoriteDomainModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? ingredients = null,
    Object? image = null,
    Object? id = null,
  }) {
    return _then(
      _value.copyWith(
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            ingredients:
                null == ingredients
                    ? _value.ingredients
                    : ingredients // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            image:
                null == image
                    ? _value.image
                    : image // ignore: cast_nullable_to_non_nullable
                        as String,
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FavoriteDomainModelImplCopyWith<$Res>
    implements $FavoriteDomainModelCopyWith<$Res> {
  factory _$$FavoriteDomainModelImplCopyWith(
    _$FavoriteDomainModelImpl value,
    $Res Function(_$FavoriteDomainModelImpl) then,
  ) = __$$FavoriteDomainModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    String description,
    List<String> ingredients,
    String image,
    int id,
  });
}

/// @nodoc
class __$$FavoriteDomainModelImplCopyWithImpl<$Res>
    extends _$FavoriteDomainModelCopyWithImpl<$Res, _$FavoriteDomainModelImpl>
    implements _$$FavoriteDomainModelImplCopyWith<$Res> {
  __$$FavoriteDomainModelImplCopyWithImpl(
    _$FavoriteDomainModelImpl _value,
    $Res Function(_$FavoriteDomainModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FavoriteDomainModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? ingredients = null,
    Object? image = null,
    Object? id = null,
  }) {
    return _then(
      _$FavoriteDomainModelImpl(
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        ingredients:
            null == ingredients
                ? _value._ingredients
                : ingredients // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        image:
            null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                    as String,
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FavoriteDomainModelImpl implements _FavoriteDomainModel {
  const _$FavoriteDomainModelImpl({
    required this.title,
    required this.description,
    required final List<String> ingredients,
    required this.image,
    required this.id,
  }) : _ingredients = ingredients;

  factory _$FavoriteDomainModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteDomainModelImplFromJson(json);

  @override
  final String title;
  @override
  final String description;
  final List<String> _ingredients;
  @override
  List<String> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  final String image;
  @override
  final int id;

  @override
  String toString() {
    return 'FavoriteDomainModel(title: $title, description: $description, ingredients: $ingredients, image: $image, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteDomainModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._ingredients,
              _ingredients,
            ) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    description,
    const DeepCollectionEquality().hash(_ingredients),
    image,
    id,
  );

  /// Create a copy of FavoriteDomainModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteDomainModelImplCopyWith<_$FavoriteDomainModelImpl> get copyWith =>
      __$$FavoriteDomainModelImplCopyWithImpl<_$FavoriteDomainModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoriteDomainModelImplToJson(this);
  }
}

abstract class _FavoriteDomainModel implements FavoriteDomainModel {
  const factory _FavoriteDomainModel({
    required final String title,
    required final String description,
    required final List<String> ingredients,
    required final String image,
    required final int id,
  }) = _$FavoriteDomainModelImpl;

  factory _FavoriteDomainModel.fromJson(Map<String, dynamic> json) =
      _$FavoriteDomainModelImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  List<String> get ingredients;
  @override
  String get image;
  @override
  int get id;

  /// Create a copy of FavoriteDomainModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FavoriteDomainModelImplCopyWith<_$FavoriteDomainModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
