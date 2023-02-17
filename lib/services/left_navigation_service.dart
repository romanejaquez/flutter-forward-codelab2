import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roman_web_portfolio/helpers/utils.dart';
import 'package:roman_web_portfolio/models/left_navigation_item.dart';

class LeftNavigationService extends ChangeNotifier {

  List<LeftNavigationItem> navItems = Utils.getDefaultNavItems();

  LeftNavigationService() {
    navItems.first.isSelected = true;
  }

  void selectNavItem(LeftNavigationItem item) {
    for (var element in navItems) {
      element.isSelected = item == element;
    }

    GoRouter.of(Utils.tabNav.currentContext!).go(item.route);
    notifyListeners();
  }

}