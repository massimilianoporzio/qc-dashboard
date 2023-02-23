import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:qc_dashboard/core/presentation/cubit/menu_cubit.dart';

final sl = GetIt.instance;

FutureOr<void> init() async {
  //*BLOCS/CUBITS
  sl.registerFactory<MenuCubit>(() => MenuCubit());

  //*EXTERNAL
}
