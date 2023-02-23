import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qc_dashboard/core/presentation/themes/app_theme.dart';

import 'core/presentation/layout/app_layout.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'QC Mammography Dashboard',
      debugShowCheckedModeBanner: false,
      theme: appTheme(context),
      home: SiteLayout(),
    );
  }
}
