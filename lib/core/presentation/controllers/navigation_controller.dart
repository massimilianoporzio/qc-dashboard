import 'package:flutter/material.dart';

class NavigationController {
  final GlobalKey<NavigatorState> navigationKey = GlobalKey();

  Future<dynamic> navigateTo(String routeName) {
    return navigationKey.currentState!.pushNamed(routeName);
  }

  void goBack() => navigationKey.currentState!.pop();
}
