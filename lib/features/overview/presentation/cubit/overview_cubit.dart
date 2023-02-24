import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'overview_state.dart';

class OverviewCubit extends Cubit<OverviewState> {
  OverviewCubit() : super(OverviewInitial());
}
