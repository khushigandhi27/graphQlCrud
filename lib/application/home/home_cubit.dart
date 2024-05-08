import 'package:app/domain/menu/menu_repository.dart';
import 'package:app/infrastructure/menu/i_menu_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/core/config/app_config.dart';
import '../../infrastructure/dtos/menu_dto.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(super.initialState);

  Future<void> init() async {
    emit(state.copyWith(isLoading: true));

    final menuItems = await state.menuRepository.getMenuItems();

    emit(state.copyWith(
      isLoading: false,
      lsOfMenuItems: menuItems,
    ));
  }

  void emitFromAnywhere({required HomeState state}) {
    emit(state);
  }
}
