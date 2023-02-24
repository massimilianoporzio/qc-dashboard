import 'package:flutter/material.dart';
import 'package:qc_dashboard/core/presentation/helpers/responsiveness.dart';

import 'horizontal_menu_item.dart';
import 'vertical_menu_item.dart';

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;

  const SideMenuItem({
    Key? key,
    required this.itemName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ResponsiveWidget.isSmallScreen(context)) {
      return VerticalMenuItem(itemName: itemName, onTap: onTap); //ver
    } else {
      return HorizontalMenuItem(itemName: itemName, onTap: onTap); //hor
    }
  }
}
