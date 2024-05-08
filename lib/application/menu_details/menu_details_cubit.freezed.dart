// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MenuDetailsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccessful => throw _privateConstructorUsedError;
  bool get isFailed => throw _privateConstructorUsedError;
  bool get noUse => throw _privateConstructorUsedError;
  MenuRepository get menuRepository => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  MenuDto? get menu => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MenuDetailsStateCopyWith<MenuDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuDetailsStateCopyWith<$Res> {
  factory $MenuDetailsStateCopyWith(
          MenuDetailsState value, $Res Function(MenuDetailsState) then) =
      _$MenuDetailsStateCopyWithImpl<$Res, MenuDetailsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccessful,
      bool isFailed,
      bool noUse,
      MenuRepository menuRepository,
      String id,
      MenuDto? menu});

  $MenuDtoCopyWith<$Res>? get menu;
}

/// @nodoc
class _$MenuDetailsStateCopyWithImpl<$Res, $Val extends MenuDetailsState>
    implements $MenuDetailsStateCopyWith<$Res> {
  _$MenuDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccessful = null,
    Object? isFailed = null,
    Object? noUse = null,
    Object? menuRepository = null,
    Object? id = null,
    Object? menu = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessful: null == isSuccessful
          ? _value.isSuccessful
          : isSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailed: null == isFailed
          ? _value.isFailed
          : isFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      noUse: null == noUse
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      menuRepository: null == menuRepository
          ? _value.menuRepository
          : menuRepository // ignore: cast_nullable_to_non_nullable
              as MenuRepository,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      menu: freezed == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as MenuDto?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MenuDtoCopyWith<$Res>? get menu {
    if (_value.menu == null) {
      return null;
    }

    return $MenuDtoCopyWith<$Res>(_value.menu!, (value) {
      return _then(_value.copyWith(menu: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MenuDetailsStateImplCopyWith<$Res>
    implements $MenuDetailsStateCopyWith<$Res> {
  factory _$$MenuDetailsStateImplCopyWith(_$MenuDetailsStateImpl value,
          $Res Function(_$MenuDetailsStateImpl) then) =
      __$$MenuDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccessful,
      bool isFailed,
      bool noUse,
      MenuRepository menuRepository,
      String id,
      MenuDto? menu});

  @override
  $MenuDtoCopyWith<$Res>? get menu;
}

/// @nodoc
class __$$MenuDetailsStateImplCopyWithImpl<$Res>
    extends _$MenuDetailsStateCopyWithImpl<$Res, _$MenuDetailsStateImpl>
    implements _$$MenuDetailsStateImplCopyWith<$Res> {
  __$$MenuDetailsStateImplCopyWithImpl(_$MenuDetailsStateImpl _value,
      $Res Function(_$MenuDetailsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccessful = null,
    Object? isFailed = null,
    Object? noUse = null,
    Object? menuRepository = null,
    Object? id = null,
    Object? menu = freezed,
  }) {
    return _then(_$MenuDetailsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessful: null == isSuccessful
          ? _value.isSuccessful
          : isSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailed: null == isFailed
          ? _value.isFailed
          : isFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      noUse: null == noUse
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      menuRepository: null == menuRepository
          ? _value.menuRepository
          : menuRepository // ignore: cast_nullable_to_non_nullable
              as MenuRepository,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      menu: freezed == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as MenuDto?,
    ));
  }
}

/// @nodoc

class _$MenuDetailsStateImpl implements _MenuDetailsState {
  const _$MenuDetailsStateImpl(
      {required this.isLoading,
      required this.isSuccessful,
      required this.isFailed,
      required this.noUse,
      required this.menuRepository,
      required this.id,
      this.menu});

  @override
  final bool isLoading;
  @override
  final bool isSuccessful;
  @override
  final bool isFailed;
  @override
  final bool noUse;
  @override
  final MenuRepository menuRepository;
  @override
  final String id;
  @override
  final MenuDto? menu;

  @override
  String toString() {
    return 'MenuDetailsState(isLoading: $isLoading, isSuccessful: $isSuccessful, isFailed: $isFailed, noUse: $noUse, menuRepository: $menuRepository, id: $id, menu: $menu)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuDetailsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccessful, isSuccessful) ||
                other.isSuccessful == isSuccessful) &&
            (identical(other.isFailed, isFailed) ||
                other.isFailed == isFailed) &&
            (identical(other.noUse, noUse) || other.noUse == noUse) &&
            (identical(other.menuRepository, menuRepository) ||
                other.menuRepository == menuRepository) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.menu, menu) || other.menu == menu));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isSuccessful,
      isFailed, noUse, menuRepository, id, menu);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuDetailsStateImplCopyWith<_$MenuDetailsStateImpl> get copyWith =>
      __$$MenuDetailsStateImplCopyWithImpl<_$MenuDetailsStateImpl>(
          this, _$identity);
}

abstract class _MenuDetailsState implements MenuDetailsState {
  const factory _MenuDetailsState(
      {required final bool isLoading,
      required final bool isSuccessful,
      required final bool isFailed,
      required final bool noUse,
      required final MenuRepository menuRepository,
      required final String id,
      final MenuDto? menu}) = _$MenuDetailsStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSuccessful;
  @override
  bool get isFailed;
  @override
  bool get noUse;
  @override
  MenuRepository get menuRepository;
  @override
  String get id;
  @override
  MenuDto? get menu;
  @override
  @JsonKey(ignore: true)
  _$$MenuDetailsStateImplCopyWith<_$MenuDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
