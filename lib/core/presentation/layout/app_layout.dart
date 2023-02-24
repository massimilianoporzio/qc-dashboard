import 'package:flutter/material.dart';
import 'package:qc_dashboard/core/presentation/helpers/responsiveness.dart';
import 'package:qc_dashboard/core/presentation/layout/large_screen.dart';
import 'package:qc_dashboard/core/presentation/layout/small_screen.dart';
import 'package:qc_dashboard/core/presentation/widgets/side_menu.dart';
import 'package:qc_dashboard/core/presentation/widgets/top_nav.dart';

import '../themes/colors.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  SiteLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: dark,
        appBar: topNavigationAppBar(context, scaffoldKey),
        drawer: Drawer(
          backgroundColor: Colors.transparent,
          width: MediaQuery.of(context).size.width * .3,
          child: const SideMenu(),
        ),
        body: const ResponsiveWidget(
          largeScreen: LargeScreen(),
          smallScreen: SmallScreen(),
        ));
  }
}
