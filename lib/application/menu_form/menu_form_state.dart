part of 'menu_form_cubit.dart';

@freezed
class MenuFormState with _$MenuFormState {
  const factory MenuFormState({
    required bool isLoading,
    required bool isSuccessful,
    required bool isFailed,
    required bool noUse,
    required bool isEditMode,
    required String msg,
    required GlobalKey<FormState> formKey,
    required TextEditingController titleController,
    required TextEditingController descController,
    required TextEditingController priceController,
    required TextEditingController categoryController,
    required MenuRepository menuRepository,
    required String menuId,
    MenuDto? menuDto,
  }) = _MenuFormState;

  factory MenuFormState.initial({
    required bool isEditMode,
    required String menuId,
    required GraphQLService graphQLService,
  }) =>
      MenuFormState(
        isEditMode: isEditMode,
        noUse: false,
        menuId: menuId,
        isLoading: true,
        isFailed: false,
        msg: '',
        formKey: GlobalKey<FormState>(),
        menuRepository: IMenuRepository(graphQLService: graphQLService),
        isSuccessful: false,
        categoryController: TextEditingController(),
        descController: TextEditingController(),
        priceController: TextEditingController(),
        titleController: TextEditingController(),
      );
}
