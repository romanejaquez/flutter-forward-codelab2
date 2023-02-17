import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roman_web_portfolio/helpers/colors.dart';
import 'package:roman_web_portfolio/helpers/personal_portfolio_icons_icons.dart';
import 'package:roman_web_portfolio/services/twitter_page_service.dart';

class TwitterPage extends StatelessWidget {
  static const String route = '/twitter';
  const TwitterPage({super.key});

  @override
  Widget build(BuildContext context) {

    var twitterPageService = context.read<TwitterPageService>();

    var mainTitle = twitterPageService.mainTitle;
    var subTitle = twitterPageService.subTitle;
    IconData icon = twitterPageService.icon;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 80,
            color: PersonalPortfolioColors.lightBlue),
          Text(mainTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
              color: Colors.white
            )
          ),
          Text(subTitle, style: 
            const TextStyle(
              fontSize: 40,
              color: PersonalPortfolioColors.lightBlue
            )
          ),
        ],
      )
    );
  }
}