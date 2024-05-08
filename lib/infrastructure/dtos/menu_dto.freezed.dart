// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MenuDto _$MenuDtoFromJson(Map<String, dynamic> json) {
  return _MenuDto.fromJson(json);
}

/// @nodoc
mixin _$MenuDto {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'category')
  String get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'title', defaultValue: '')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  int get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuDtoCopyWith<MenuDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuDtoCopyWith<$Res> {
  factory $MenuDtoCopyWith(MenuDto value, $Res Function(MenuDto) then) =
      _$MenuDtoCopyWithImpl<$Res, MenuDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'category') String category,
      @JsonKey(name: 'title', defaultValue: '') String title,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'price') int price});
}

/// @nodoc
class _$MenuDtoCopyWithImpl<$Res, $Val extends MenuDto>
    implements $MenuDtoCopyWith<$Res> {
  _$MenuDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? title = null,
    Object? description = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuDtoImplCopyWith<$Res> implements $MenuDtoCopyWith<$Res> {
  factory _$$MenuDtoImplCopyWith(
          _$MenuDtoImpl value, $Res Function(_$MenuDtoImpl) then) =
      __$$MenuDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'category') String category,
      @JsonKey(name: 'title', defaultValue: '') String title,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'price') int price});
}

/// @nodoc
class __$$MenuDtoImplCopyWithImpl<$Res>
    extends _$MenuDtoCopyWithImpl<$Res, _$MenuDtoImpl>
    implements _$$MenuDtoImplCopyWith<$Res> {
  __$$MenuDtoImplCopyWithImpl(
      _$MenuDtoImpl _value, $Res Function(_$MenuDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? title = null,
    Object? description = null,
    Object? price = null,
  }) {
    return _then(_$MenuDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuDtoImpl implements _MenuDto {
  _$MenuDtoImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'category') required this.category,
      @JsonKey(name: 'title', defaultValue: '') required this.title,
      @JsonKey(name: 'description') required this.description,
      @JsonKey(name: 'price') required this.price});

  factory _$MenuDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'category')
  final String category;
  @override
  @JsonKey(name: 'title', defaultValue: '')
  final String title;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'price')
  final int price;

  @override
  String toString() {
    return 'MenuDto(id: $id, category: $category, title: $title, description: $description, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, category, title, description, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuDtoImplCopyWith<_$MenuDtoImpl> get copyWith =>
      __$$MenuDtoImplCopyWithImpl<_$MenuDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuDtoImplToJson(
      this,
    );
  }
}

abstract class _MenuDto implements MenuDto {
  factory _MenuDto(
      {@JsonKey(name: 'id') required final String id,
      @JsonKey(name: 'category') required final String category,
      @JsonKey(name: 'title', defaultValue: '') required final String title,
      @JsonKey(name: 'description') required final String description,
      @JsonKey(name: 'price') required final int price}) = _$MenuDtoImpl;

  factory _MenuDto.fromJson(Map<String, dynamic> json) = _$MenuDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'category')
  String get category;
  @override
  @JsonKey(name: 'title', defaultValue: '')
  String get title;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'price')
  int get price;
  @override
  @JsonKey(ignore: true)
  _$$MenuDtoImplCopyWith<_$MenuDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
