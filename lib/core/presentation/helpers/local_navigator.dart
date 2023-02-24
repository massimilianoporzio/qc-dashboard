import 'package:flutter/material.dart';
import 'package:qc_dashboard/core/presentation/controllers/navigation_controller.dart';
import 'package:qc_dashboard/core/routes/router.dart';
import 'package:qc_dashboard/core/routes/routes.dart';

import '../../services/service_locator.dart';

Navigator localNavigator() => Navigator(
      key: sl<NavigationController>().navigationKey,
      initialRoute: AppRoutes.overviewPageRoute,
      onGenerateRoute: generateRoute,
    );
