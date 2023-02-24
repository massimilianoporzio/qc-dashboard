import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qc_dashboard/core/presentation/themes/colors.dart';
import 'package:qc_dashboard/core/utils/side_menu_constants.dart';
import 'package:recase/recase.dart';

import '../cubit/menu_cubit.dart';
import 'custom_text.dart';

class HorizontalMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;
  const HorizontalMenuItem(
      {Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
                  width: 6,
                  height: 40,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: width / 88),
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
        ));
  }
}
