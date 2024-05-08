part of 'menu_form_cubit.dart';

@freezed
class MenuFormState with _$MenuFormState {
  const factory MenuFormState({
    required bool isLoading,
    required bool isSuccessful,
    required bool isFailed,
    required bool noUse,
  }) = _MenuFormState;

  factory MenuFormState.initial() => const MenuFormState(
        noUse: false,
        isLoading: false,
        isFailed: false,
        isSuccessful: false,
      );
}
