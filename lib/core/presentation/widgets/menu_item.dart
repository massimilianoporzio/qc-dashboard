import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qc_dashboard/core/presentation/cubit/menu_cubit.dart';
import 'package:qc_dashboard/core/presentation/themes/colors.dart';
import 'package:qc_dashboard/core/utils/side_menu_constants.dart';

class MenuIcon extends StatelessWidget {
  final String menuItem;
  const MenuIcon({super.key, required this.menuItem});

  @override
  Widget build(BuildContext context) {
    final String activeItem = context.watch<MenuCubit>().state.activeItem;
    final String hoverItem = context.watch<MenuCubit>().state.hoverItem;

    return returnIconFor(menuItem,
        activeItem: activeItem, hoverItem: hoverItem);
  }
}

Widget returnIconFor(String itemName,
    {required String activeItem, required String hoverItem}) {
  switch (itemName) {
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

bool isActive(String itemName, String activeItem) => activeItem == itemName;
bool isHovering(String itemName, String hoverItem) => hoverItem == itemName;

Widget _customIcon(
  IconData icon, {
  required String itemName,
  required String activeItem,
  required String hoverItem,
}) {
  if (!isActive(itemName, activeItem)) {
    return Icon(
      icon,
      size: 22,
      color: lightGray,
    );
  }
  return Icon(icon, color: isHovering(itemName, hoverItem) ? light : dark);
}
