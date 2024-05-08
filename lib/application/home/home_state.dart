part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required bool isLoading,
    required bool isSuccessful,
    required bool isFailed,
    required bool noUse,
    required MenuRepository menuRepository,
    required List<MenuDto> lsOfMenuItems,
  }) = _HomeState;

  factory HomeState.initial({required AppStateNotifier appStateNotifier}) =>
      HomeState(
        noUse: false,
        isLoading: false,
        isFailed: false,
        isSuccessful: false,
        lsOfMenuItems: [],
        menuRepository: IMenuRepository(
          graphQLService: appStateNotifier.graphQLService,
        ),
      );
}
