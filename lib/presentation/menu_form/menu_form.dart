import 'package:app/presentation/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/menu_form/menu_form_cubit.dart';
import '../../domain/core/config/app_config.dart';
import '../../domain/core/config/injection.dart';
import '../../domain/core/services/navigation_services/navigation_service.dart';
import '../../domain/core/services/navigation_services/routers/route_name.dart';
import '../core/widgets/custom_flushbar.dart';
import '../core/widgets/primary_button.dart';

class MenuFormScreen extends StatelessWidget {
  final bool isEdit;
  final String menuId;

  const MenuFormScreen({super.key, this.isEdit = false, this.menuId =''});

  @override
  Widget build(BuildContext context) {
    final AppStateNotifier appStateNotifier =
        Provider.of<AppStateNotifier>(context);
    return BlocProvider(
      create: (context) => MenuFormCubit(MenuFormState.initial(
        menuId: menuId,
        isEditMode: isEdit,
        graphQLService: appStateNotifier.graphQLService,
      ))..init(),
      child: const MenuFormScreenConsumer(),
    );
  }
}

class MenuFormScreenConsumer extends StatelessWidget {
  const MenuFormScreenConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MenuFormCubit, MenuFormState>(
      listener: (context, state) {
        final thisCubit = context.read<MenuFormCubit>();
        if (state.isSuccessful) {
          if (state.msg.isNotEmpty) {
            CustomFlushBar.showSuccessOrFail(
                context: context, message: state.msg);
          }
          Future.delayed(const Duration(seconds: 1)).then(
            (value) {
              navigator<NavigationService>()
                  .navigateTo(CommonRoutes.homeRoute, isClearStack: true);
            },
          );
        } else if (state.isFailed) {
          if (state.msg.isNotEmpty) {
            CustomFlushBar.showSuccessOrFail(
                context: context, isFailed: true, message: state.msg);
          }

          thisCubit.emitFromAnywhere(
              state: state.copyWith(isFailed: false, msg: ''));
        }
      },
      builder: (context, state) {
        final thisCubit = context.read<MenuFormCubit>();

        return ModalProgressHUD(
          inAsyncCall: state.isLoading,
          child: Scaffold(
            appBar: AppBar(
              foregroundColor: Theme.of(context).scaffoldBackgroundColor,
              backgroundColor: Theme.of(context).colorScheme.primary,
              title: Text(
                state.isEditMode ? 'Update Menu Item' : 'Create Menu Item',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFFFFFFF),
                    ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
              child: SingleChildScrollView(
                child: Form(
                  key: state.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryTextField(
                        controller: state.titleController,
                        hintText: 'Enter your title',
                        inputWithLabel: true,
                        labelText: 'Title',
                        maxLines: 1,
                        validator: (val) {
                          if ((val ?? '').isEmpty) {
                            return 'Required';
                          }

                          return null;
                        },
                      ),
                      PrimaryTextField(
                        controller: state.descController,
                        customContentPadding: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 2.w),
                        inputWithLabel: true,
                        keyboardType: TextInputType.multiline,
                        hintText: 'Enter your Description',
                        labelText: 'Description',
                        maxLines: 5,
                        validator: (val) {
                          if ((val ?? '').isEmpty) {
                            return 'Required';
                          }

                          return null;
                        },
                      ),
                      PrimaryTextField(
                        controller: state.categoryController,
                        maxLines: 1,
                        hintText: 'Category',
                        inputWithLabel: true,
                        labelText: 'Category',
                        validator: (val) {
                          if ((val ?? '').isEmpty) {
                            return 'Required';
                          }

                          return null;
                        },
                      ),
                      PrimaryTextField(
                        maxLines: 1,
                        controller: state.priceController,
                        hintText: 'Price',
                        inputWithLabel: true,
                        labelText: 'Price',
                        keyboardType: TextInputType.number,
                        validator: (val) {
                          if ((val ?? '').isEmpty) {
                            return 'Required';
                          }

                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: SafeArea(
                child: Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                    child: PrimaryButton(
                      text: state.isEditMode ? 'Update' : 'Save',
                      function: () {
                        FocusScope.of(context).unfocus();
                        if (state.isEditMode) {
                          thisCubit.updateMenuItem();
                        } else {
                          thisCubit.addNewMenuItem();
                        }
                      },
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      borderColor: Colors.transparent,
                      elevation: 0,
                      textColor: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                )
              ],
            )),
          ),
        );
      },
    );
  }
}
