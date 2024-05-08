part of 'menu_details_cubit.dart';

@freezed
class MenuDetailsState with _$MenuDetailsState {
  const factory MenuDetailsState({
    required bool isLoading,
    required bool isSuccessful,
    required bool isFailed,
    required bool noUse,
    required MenuRepository menuRepository,
    required String id,
    MenuDto? menu,
  }) = _MenuDetailsState;

  factory MenuDetailsState.initial(
          {required AppStateNotifier appStateNotifier, required String id}) =>
      MenuDetailsState(
        noUse: false,
        isLoading: false,
        isFailed: false,
        isSuccessful: false,
        id: id,
        menuRepository:
            IMenuRepository(graphQLService: appStateNotifier.graphQLService),
      );
}
