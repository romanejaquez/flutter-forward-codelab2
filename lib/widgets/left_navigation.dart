import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roman_web_portfolio/helpers/colors.dart';
import 'package:roman_web_portfolio/services/left_navigation_service.dart';

class LeftNavigation extends StatelessWidget {
  const LeftNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.25),
            Colors.transparent,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        )
      ),
      padding: const EdgeInsets.all(20),

      // LeftNavigationService consumer
      child: Consumer<LeftNavigationService>(
        builder: (context, navService, child) {
          return Column(
            children: List.generate(navService.navItems.length, (index) {

                var navItem = navService.navItems[index];
                var navItemColor = navItem.isSelected ? 
                  Colors.white : PersonalPortfolioColors.lightBlue;

                return Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  child: IconButton(
                    iconSize: 30,
                    icon: Icon(
                      navItem.icon,
                      color: navItemColor,
                    ),
                    onPressed: () {
                      navService.selectNavItem(navItem);
                    }
                  ),
                );
                      
              }
            ),
          );
        }
      )

    );
  }
}