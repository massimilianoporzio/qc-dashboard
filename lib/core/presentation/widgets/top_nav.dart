import 'package:flutter/material.dart';
import 'package:qc_dashboard/core/presentation/helpers/responsiveness.dart';
import 'package:qc_dashboard/core/presentation/themes/colors.dart';
import 'package:qc_dashboard/core/presentation/widgets/custom_text.dart';

AppBar topNavigationAppBar(BuildContext context, GlobalKey<ScaffoldState> key) {
  bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);
  return AppBar(
    leading: !ResponsiveWidget.isSmallScreen(context)
        ? Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 14),
                child: Image.asset(
                  "assets/icons/fioccoMammo.png",
                  width: 28,
                ),
              )
            ],
          )
        : IconButton(
            onPressed: () {
              key.currentState?.openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    toolbarTextStyle: const TextStyle(color: Colors.white),
    title: Row(
      children: [
        Visibility(
          child: CustomText(
            text: "QC settimanali",
            size: isSmallScreen ? 16 : 20, weight: FontWeight.bold,
            // color: lightGray,
          ),
        ),
        Expanded(
          child: Container(),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.settings,
            color: Colors.white.withOpacity(0.7),
            size: isSmallScreen ? 18 : 20,
          ),
        ),
        Stack(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                size: isSmallScreen ? 18 : 20,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
            Positioned(
              top: 7,
              right: 7,
              child: Container(
                width: 12,
                height: 12,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: activeDark,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: dark)),
              ),
            ),
          ],
        ),
        Container(
          width: 1,
          height: 22,
          color: lightGray,
        ),
        const SizedBox(
          width: 24,
        ),
        CustomText(
          text: "Massimiliano Porzio",
          size: isSmallScreen ? 14 : 16,
        ),
        const SizedBox(
          width: 16,
        ),
        Container(
          decoration: BoxDecoration(
              color: dark, borderRadius: BorderRadius.circular(30)),
          child: Container(
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.all(2),
            child: CircleAvatar(
              maxRadius: isSmallScreen ? 12 : 16,
              backgroundColor: lightGray,
              child: Icon(
                Icons.person_outline,
                color: Colors.white,
                size: isSmallScreen ? 16 : 18,
              ),
            ),
          ),
        )
      ],
    ),
    iconTheme: IconThemeData(color: light),
  );
}
