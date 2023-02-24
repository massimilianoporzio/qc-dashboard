import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qc_dashboard/core/presentation/cubit/menu_cubit.dart';
import 'package:qc_dashboard/core/presentation/widgets/custom_text.dart';
import 'package:qc_dashboard/core/utils/side_menu_constants.dart';
import 'package:recase/recase.dart';

import '../themes/colors.dart';

class MenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;
  final bool isVertical;

  const MenuItem(
      {Key? key,
      required this.itemName,
      required this.onTap,
      this.isVertical = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    String activeItem = context.watch<MenuCubit>().state.activeItem;
    String hoverItem = context.watch<MenuCubit>().state.hoverItem;
    print('activeItem: $activeItem, hoverItem: $hoverItem');
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        final name = value ? itemName : "not hovering";
        context.read<MenuCubit>().onHover(name);
      },
      child: Container(
        color: SideMenuConstants.isHovering(itemName, hoverItem)
            ? dark.withOpacity(0.1)
            : Colors.transparent,
        child: Row(
          children: [
            Visibility(
              visible: SideMenuConstants.isHovering(itemName, hoverItem) ||
                  SideMenuConstants.isActive(itemName, activeItem),
              maintainSize: true,
              maintainState: true,
              maintainAnimation: true,
              child: Container(
                width: isVertical ? 3 : 6,
                height: isVertical ? 72 : 40,
                color: light,
              ),
            ),
            if (isVertical)
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: SideMenuConstants.returnIconFor(itemName,
                        activeItem: activeItem, hoverItem: hoverItem),
                  ),
                  if (!SideMenuConstants.isActive(itemName, activeItem))
                    Flexible(
                        child: CustomText(
                      text: itemName.sentenceCase,
                      color: SideMenuConstants.isHovering(itemName, hoverItem)
                          ? lightGray
                          : Colors.amber,
                    ))
                  else
                    Flexible(
                      child: CustomText(
                        text: itemName.sentenceCase,
                        color: Colors.amber,
                        size: 18,
                        weight: FontWeight.bold,
                      ),
                    )
                ],
              ))
            else
              SizedBox(width: width / 80),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SideMenuConstants.returnIconFor(itemName,
                  activeItem: activeItem, hoverItem: hoverItem),
            ),
            if (!SideMenuConstants.isActive(itemName, activeItem))
              Flexible(
                  child: CustomText(
                text: itemName.sentenceCase,
                color: SideMenuConstants.isHovering(itemName, hoverItem)
                    ? lightGray
                    : light,
              ))
            else
              Flexible(
                child: CustomText(
                  text: itemName.sentenceCase,
                  color: Colors.amber,
                  size: 18,
                  weight: FontWeight.bold,
                ),
              )
          ],
        ),
      ),
    );
  }
}
