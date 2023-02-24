import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qc_dashboard/core/utils/side_menu_constants.dart';
import 'package:recase/recase.dart';

import '../cubit/menu_cubit.dart';
import '../themes/colors.dart';
import 'custom_text.dart';

class VerticalMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;
  const VerticalMenuItem(
      {Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String activeItem = context.watch<MenuCubit>().state.activeItem;
    String hoverItem = context.watch<MenuCubit>().state.hoverItem;
    return InkWell(
        onTap: onTap,
        onHover: (value) {
          value
              ? context.read<MenuCubit>().onHover(itemName)
              : context.read<MenuCubit>().onHover("not hovering");
        },
        child: Container(
          color: SideMenuConstants.isHovering(
                  itemName: itemName, hoverItem: hoverItem)
              ? lightGrey.withOpacity(.1)
              : Colors.transparent,
          child: Row(
            children: [
              Visibility(
                visible: SideMenuConstants.isHovering(
                        itemName: itemName, hoverItem: hoverItem) ||
                    SideMenuConstants.isActive(
                        itemName: itemName, activeItem: activeItem),
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Container(
                  width: 3,
                  height: 72,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: SideMenuConstants.returnIconFor(itemName,
                          activeItem: activeItem, hoverItem: hoverItem),
                    ),
                    if (!SideMenuConstants.isActive(
                        itemName: itemName, activeItem: activeItem))
                      Flexible(
                          child: CustomText(
                        text: itemName.sentenceCase,
                        color: SideMenuConstants.isHovering(
                                itemName: itemName, hoverItem: hoverItem)
                            ? Colors.white
                            : lightGrey,
                      ))
                    else
                      Flexible(
                          child: CustomText(
                        text: itemName.sentenceCase,
                        color: Colors.white,
                        size: 18,
                        weight: FontWeight.bold,
                      ))
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
