import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:qc_dashboard/core/presentation/controllers/navigation_controller.dart';
import 'package:qc_dashboard/core/presentation/cubit/menu_cubit.dart';
import 'package:qc_dashboard/core/presentation/helpers/responsiveness.dart';
import 'package:qc_dashboard/core/presentation/themes/colors.dart';
import 'package:qc_dashboard/core/utils/side_menu_constants.dart';

import '../../services/service_locator.dart';
import 'custom_text.dart';
import 'side_menu_item.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    String activeItem = context.watch<MenuCubit>().state.activeItem;

    return Container(
      color: dark,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width / 48,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image.asset(
                        "assets/icons/fioccoMammo.png",
                        width: 18,
                      ),
                    ),
                    Flexible(
                      child: CustomText(
                        text: "QC Settimanali",
                        size: ResponsiveWidget.isSmallScreen(context) ? 16 : 20,
                        weight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: width / 48,
                    ),
                  ],
                ),
              ],
            ),
          const SizedBox(
            height: 40,
          ),
          Divider(
            color: lightGrey.withOpacity(0.1),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: SideMenuConstants.sideMenuItems
                .map((itemName) => SideMenuItem(
                      itemName: itemName == SideMenuConstants.authPage
                          ? 'Log Out'
                          : itemName,
                      onTap: () {
                        if (itemName == SideMenuConstants.authPage) {
                          //TODO: logout and go to auth page
                          context
                              .read<MenuCubit>()
                              .changeActiveItemsTo(itemName.toLowerCase());
                        }
                        if (!SideMenuConstants.isActive(
                            //se attivo anche se ci riclicco non cambio pagina
                            itemName: itemName,
                            activeItem: activeItem)) {
                          context
                              .read<MenuCubit>()
                              .changeActiveItemsTo(itemName.toLowerCase());
                          if (ResponsiveWidget.isSmallScreen(context)) {
                            Get.back();
                            //TODO: go to item route
                          }
                          sl<NavigationController>().navigateTo(itemName);
                        }
                      },
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
