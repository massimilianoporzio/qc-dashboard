import 'package:flutter/material.dart';
import 'package:qc_dashboard/features/auth/presentation/pages/auth_page.dart';
import 'package:qc_dashboard/features/clients/presentation/pages/clients_page.dart';
import 'package:qc_dashboard/features/drivers/presentation/pages/drivers_page.dart';
import 'package:qc_dashboard/features/overview/presentation/pages/overview_page.dart';

import '../utils/side_menu_constants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SideMenuConstants.overviewPage:
      return _getPageRoute2(const OverviewPage());
    case SideMenuConstants.driversPage:
      return _getPageRoute2(const DriversPage());
    case SideMenuConstants.clientsPage:
      return _getPageRoute2(const ClientsPage());

    default:
      return _getPageRoute2(const OverviewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(
    fullscreenDialog: true,
    builder: (context) => child,
  );
}

PageRoute _getPageRoute2(Widget child) {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 0),
    pageBuilder: (context, animation, secondaryAnimation) => child,
  );
}
