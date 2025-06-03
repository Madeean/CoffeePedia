// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'CoffeeResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CoffeeHotResponse {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  List<String>? get ingredients => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Create a copy of CoffeeHotResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoffeeHotResponseCopyWith<CoffeeHotResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoffeeHotResponseCopyWith<$Res> {
  factory $CoffeeHotResponseCopyWith(
    CoffeeHotResponse value,
    $Res Function(CoffeeHotResponse) then,
  ) = _$CoffeeHotResponseCopyWithImpl<$Res, CoffeeHotResponse>;
  @useResult
  $Res call({
    int? id,
    String? title,
    List<String>? ingredients,
    String? image,
    String? description,
  });
}

/// @nodoc
class _$CoffeeHotResponseCopyWithImpl<$Res, $Val extends CoffeeHotResponse>
    implements $CoffeeHotResponseCopyWith<$Res> {
  _$CoffeeHotResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoffeeHotResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? ingredients = freezed,
    Object? image = freezed,
    Object? description = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
            title:
                freezed == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String?,
            ingredients:
                freezed == ingredients
                    ? _value.ingredients
                    : ingredients // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
            image:
                freezed == image
                    ? _value.image
                    : image // ignore: cast_nullable_to_non_nullable
                        as String?,
            description:
                freezed == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CoffeeHotResponseImplCopyWith<$Res>
    implements $CoffeeHotResponseCopyWith<$Res> {
  factory _$$CoffeeHotResponseImplCopyWith(
    _$CoffeeHotResponseImpl value,
    $Res Function(_$CoffeeHotResponseImpl) then,
  ) = __$$CoffeeHotResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String? title,
    List<String>? ingredients,
    String? image,
    String? description,
  });
}

/// @nodoc
class __$$CoffeeHotResponseImplCopyWithImpl<$Res>
    extends _$CoffeeHotResponseCopyWithImpl<$Res, _$CoffeeHotResponseImpl>
    implements _$$CoffeeHotResponseImplCopyWith<$Res> {
  __$$CoffeeHotResponseImplCopyWithImpl(
    _$CoffeeHotResponseImpl _value,
    $Res Function(_$CoffeeHotResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CoffeeHotResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? ingredients = freezed,
    Object? image = freezed,
    Object? description = freezed,
  }) {
    return _then(
      _$CoffeeHotResponseImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        title:
            freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String?,
        ingredients:
            freezed == ingredients
                ? _value._ingredients
                : ingredients // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
        image:
            freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                    as String?,
        description:
            freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$CoffeeHotResponseImpl implements _CoffeeHotResponse {
  const _$CoffeeHotResponseImpl({
    this.id,
    this.title,
    final List<String>? ingredients,
    this.image,
    this.description,
  }) : _ingredients = ingredients;

  @override
  final int? id;
  @override
  final String? title;
  final List<String>? _ingredients;
  @override
  List<String>? get ingredients {
    final value = _ingredients;
    if (value == null) return null;
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? image;
  @override
  final String? description;

  @override
  String toString() {
    return 'CoffeeHotResponse(id: $id, title: $title, ingredients: $ingredients, image: $image, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoffeeHotResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(
              other._ingredients,
              _ingredients,
            ) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    const DeepCollectionEquality().hash(_ingredients),
    image,
    description,
  );

  /// Create a copy of CoffeeHotResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoffeeHotResponseImplCopyWith<_$CoffeeHotResponseImpl> get copyWith =>
      __$$CoffeeHotResponseImplCopyWithImpl<_$CoffeeHotResponseImpl>(
        this,
        _$identity,
      );
}

abstract class _CoffeeHotResponse implements CoffeeHotResponse {
  const factory _CoffeeHotResponse({
    final int? id,
    final String? title,
    final List<String>? ingredients,
    final String? image,
    final String? description,
  }) = _$CoffeeHotResponseImpl;

  @override
  int? get id;
  @override
  String? get title;
  @override
  List<String>? get ingredients;
  @override
  String? get image;
  @override
  String? get description;

  /// Create a copy of CoffeeHotResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoffeeHotResponseImplCopyWith<_$CoffeeHotResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
