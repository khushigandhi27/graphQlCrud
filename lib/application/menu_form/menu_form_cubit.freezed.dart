// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MenuFormState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccessful => throw _privateConstructorUsedError;
  bool get isFailed => throw _privateConstructorUsedError;
  bool get noUse => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MenuFormStateCopyWith<MenuFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuFormStateCopyWith<$Res> {
  factory $MenuFormStateCopyWith(
          MenuFormState value, $Res Function(MenuFormState) then) =
      _$MenuFormStateCopyWithImpl<$Res, MenuFormState>;
  @useResult
  $Res call({bool isLoading, bool isSuccessful, bool isFailed, bool noUse});
}

/// @nodoc
class _$MenuFormStateCopyWithImpl<$Res, $Val extends MenuFormState>
    implements $MenuFormStateCopyWith<$Res> {
  _$MenuFormStateCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuFormStateImplCopyWith<$Res>
    implements $MenuFormStateCopyWith<$Res> {
  factory _$$MenuFormStateImplCopyWith(
          _$MenuFormStateImpl value, $Res Function(_$MenuFormStateImpl) then) =
      __$$MenuFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isSuccessful, bool isFailed, bool noUse});
}

/// @nodoc
class __$$MenuFormStateImplCopyWithImpl<$Res>
    extends _$MenuFormStateCopyWithImpl<$Res, _$MenuFormStateImpl>
    implements _$$MenuFormStateImplCopyWith<$Res> {
  __$$MenuFormStateImplCopyWithImpl(
      _$MenuFormStateImpl _value, $Res Function(_$MenuFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccessful = null,
    Object? isFailed = null,
    Object? noUse = null,
  }) {
    return _then(_$MenuFormStateImpl(
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
    ));
  }
}

/// @nodoc

class _$MenuFormStateImpl implements _MenuFormState {
  const _$MenuFormStateImpl(
      {required this.isLoading,
      required this.isSuccessful,
      required this.isFailed,
      required this.noUse});

  @override
  final bool isLoading;
  @override
  final bool isSuccessful;
  @override
  final bool isFailed;
  @override
  final bool noUse;

  @override
  String toString() {
    return 'MenuFormState(isLoading: $isLoading, isSuccessful: $isSuccessful, isFailed: $isFailed, noUse: $noUse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuFormStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccessful, isSuccessful) ||
                other.isSuccessful == isSuccessful) &&
            (identical(other.isFailed, isFailed) ||
                other.isFailed == isFailed) &&
            (identical(other.noUse, noUse) || other.noUse == noUse));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, isSuccessful, isFailed, noUse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuFormStateImplCopyWith<_$MenuFormStateImpl> get copyWith =>
      __$$MenuFormStateImplCopyWithImpl<_$MenuFormStateImpl>(this, _$identity);
}

abstract class _MenuFormState implements MenuFormState {
  const factory _MenuFormState(
      {required final bool isLoading,
      required final bool isSuccessful,
      required final bool isFailed,
      required final bool noUse}) = _$MenuFormStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSuccessful;
  @override
  bool get isFailed;
  @override
  bool get noUse;
  @override
  @JsonKey(ignore: true)
  _$$MenuFormStateImplCopyWith<_$MenuFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
