import 'package:flutter/material.dart';
import 'package:qc_dashboard/core/presentation/helpers/responsiveness.dart';
import 'package:qc_dashboard/core/presentation/themes/colors.dart';
import 'package:qc_dashboard/core/presentation/widgets/custom_text.dart';

AppBar topNavigationAppBar(
        BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
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
          const Visibility(
            child: CustomText(
              text: "QC settimanali",
              size: 20, weight: FontWeight.bold,
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
            ),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
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
          const CustomText(text: "Massimiliano Porzio"),
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
                backgroundColor: lightGray,
                child: const Icon(
                  Icons.person_outline,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
      iconTheme: IconThemeData(color: light),
    );
