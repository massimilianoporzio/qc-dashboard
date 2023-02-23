import 'package:recase/recase.dart';

class SideMenuConstants {
  static const overviewPage = "overview";
  static const driversPage = "drivers";
  static const clientsPage = "client";
  static const authPage = "auth";

  static List<String> sideMenuItems = [
    overviewPage.sentenceCase,
    driversPage.sentenceCase,
    clientsPage.sentenceCase,
    authPage.sentenceCase,
  ];
}
