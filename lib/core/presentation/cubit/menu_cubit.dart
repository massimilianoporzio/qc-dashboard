import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qc_dashboard/core/utils/side_menu_constants.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuState.initial());

  void changeActiveItemsTo(String itemName) {
    emit(state.copyWith(activeItem: itemName));
  }

  void onHover(String itemName) {
    if (state.activeItem != itemName) {
      emit(state.copyWith(hoverItem: itemName));
    }
  }
}
