import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_form_state.dart';
part 'menu_form_cubit.freezed.dart';

class MenuFormCubit extends Cubit<MenuFormState> {
  MenuFormCubit(super.initialState);

  void init() {}

  void emitFromAnywhere({required MenuFormState state}) {
    emit(state);
  }
}
