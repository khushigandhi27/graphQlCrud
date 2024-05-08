import 'package:app/domain/core/services/graphql_services/graphql_service.dart';
import 'package:app/infrastructure/dtos/menu_dto.dart';
import 'package:app/infrastructure/menu/i_menu_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/menu/menu_repository.dart';

part 'menu_form_state.dart';
part 'menu_form_cubit.freezed.dart';

class MenuFormCubit extends Cubit<MenuFormState> {
  MenuFormCubit(super.initialState);

  void init() async {
    if (state.isEditMode) {
      final res = await state.menuRepository.getMenuItemById(id: state.menuId);

      res.fold((l) {
        emit(state.copyWith(
          isLoading: false,
          isFailed: true,
          msg: 'Failed to load menu details',
        ));
      }, (r) {
        emit(state.copyWith(
          menuDto: r,
          isLoading: false,
          menuId: r.id,
        ));

        state.titleController.text = r.title;
        state.descController.text = r.description;
        state.categoryController.text = r.category;
        state.priceController.text = r.price.toString();
      });
    } else {
      emit(state.copyWith(
        isLoading: false,
      ));
    }
  }

  void updateMenuItem() async {
    final title = state.titleController.text.trim();
    final desc = state.descController.text.trim();
    final price = state.priceController.text.trim();
    final category = state.categoryController.text.trim();

    if (title.isEmpty || desc.isEmpty || price.isEmpty || category.isEmpty) {
      state.formKey.currentState!.validate();
      return;
    }

    Map<String, dynamic> updateData = {};

    if (title != state.menuDto!.title) {
      updateData['title'] = title;
    }

    if (desc != state.menuDto!.description) {
      updateData['description'] = desc;
    }

    if (category != state.menuDto!.category) {
      updateData['category'] = category;
    }

    if (price != state.menuDto!.price.toString()) {
      updateData['price'] = double.parse(price);
    }

    if (updateData.isNotEmpty) {
      updateData = {
        'title': title,
        'category': category,
        'price': double.parse(price),
        'description': desc,
      };
    } else {
      return;
    }

    emit(state.copyWith(
      isLoading: true,
    ));

    final res = await state.menuRepository
        .updateMenuItem(updateData: updateData, menuId: state.menuId);

    if (res) {
      emit(state.copyWith(
        isSuccessful: true,
        msg: 'Updated menu item successfully!,',
      ));
    } else {
      emit(
        state.copyWith(
          isFailed: true,
          isLoading: false,
          msg: 'Failed to update, Please try again!',
        ),
      );
    }
  }

  void addNewMenuItem() async {
    final title = state.titleController.text.trim();
    final desc = state.descController.text.trim();
    final price = state.priceController.text.trim();
    final category = state.categoryController.text.trim();

    if (title.isEmpty || desc.isEmpty || price.isEmpty || category.isEmpty) {
      state.formKey.currentState!.validate();
      return;
    }

    final data = {
      'title': title,
      'category': category,
      'price': double.parse(price),
      'description': desc,
    };

    emit(state.copyWith(
      isLoading: true,
    ));

    final res = await state.menuRepository.addMenuItem(data: data);

    if (res) {
      emit(state.copyWith(
        isSuccessful: true,
        msg: 'Added new menu item successfully!,',
      ));
    } else {
      emit(
        state.copyWith(
          isFailed: true,
          isLoading: false,
          msg: 'Failed to add menu item, Please try again!',
        ),
      );
    }
  }

  void emitFromAnywhere({required MenuFormState state}) {
    emit(state);
  }
}
