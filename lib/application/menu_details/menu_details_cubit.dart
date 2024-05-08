import 'package:app/domain/menu/menu_repository.dart';
import 'package:app/infrastructure/dtos/menu_dto.dart';
import 'package:app/infrastructure/menu/i_menu_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/core/config/app_config.dart';

part 'menu_details_state.dart';
part 'menu_details_cubit.freezed.dart';

class MenuDetailsCubit extends Cubit<MenuDetailsState> {
  MenuDetailsCubit(super.initialState);

  Future<void> init() async {
    emit(state.copyWith(isLoading: true));

    final response = await state.menuRepository.getMenuItemById(id: state.id);

    response.fold((l) {
      emit(
        state.copyWith(
          isLoading: false,
          isFailed: true,
          isSuccessful: false,
          menu: null,
        ),
      );
    }, (r) {
      emit(
        state.copyWith(
          isLoading: false,
          isFailed: false,
          isSuccessful: true,
          menu: r,
        ),
      );
    });
  }

  void emitFromAnywhere({required MenuDetailsState state}) {
    emit(state);
  }
}