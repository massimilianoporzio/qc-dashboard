import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import '../presentation/themes/colors.dart';

class SideMenuConstants {
  static const overviewPage = "overview";
  static const driversPage = "drivers";
  static const clientsPage = "client";
  static const authPage = "auth";

  static List<String> sideMenuItems = [
    overviewPage,
    driversPage,
    clientsPage,
    authPage,
  ];

  static bool isActive(
          {required String itemName, required String activeItem}) =>
      activeItem == itemName;
  static bool isHovering(
          {required String itemName, required String hoverItem}) =>
      hoverItem == itemName;

  static Widget returnIconFor(String itemName,
      {required String activeItem, required String hoverItem}) {
    switch (itemName.toLowerCase()) {
      case SideMenuConstants.overviewPage:
        return _customIcon(
          Icons.trending_up,
          itemName: itemName,
          activeItem: activeItem,
          hoverItem: hoverItem,
        );
      case SideMenuConstants.driversPage:
        return _customIcon(
          Icons.drive_eta,
          itemName: itemName,
          activeItem: activeItem,
          hoverItem: hoverItem,
        );
      case SideMenuConstants.clientsPage:
        return _customIcon(
          Icons.people_alt_outlined,
          itemName: itemName,
          activeItem: activeItem,
          hoverItem: hoverItem,
        );
      case SideMenuConstants.authPage:
        return _customIcon(
          Icons.exit_to_app,
          itemName: itemName,
          activeItem: activeItem,
          hoverItem: hoverItem,
        );
      default:
        return _customIcon(
          Icons.exit_to_app,
          itemName: itemName,
          activeItem: activeItem,
          hoverItem: hoverItem,
        );
    }
  }

  static Widget _customIcon(
    IconData icon, {
    required String itemName,
    required String activeItem,
    required String hoverItem,
  }) {
    if (!SideMenuConstants.isActive(
        itemName: itemName, activeItem: activeItem)) {
      return Icon(
        icon,
        size: 22,
        color: lightGrey,
      );
    }
    return Icon(icon,
        color: SideMenuConstants.isHovering(
                itemName: itemName, hoverItem: hoverItem)
            ? light
            : Colors.white);
  }
}
