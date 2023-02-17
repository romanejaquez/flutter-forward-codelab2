import 'package:flutter/material.dart';
import 'package:roman_web_portfolio/helpers/colors.dart';
import 'package:roman_web_portfolio/helpers/personal_portfolio_icons_icons.dart';

class GithubPage extends StatelessWidget {

  static const String route = '/github';

  const GithubPage({super.key});

  @override
  Widget build(BuildContext context) {

    var mainTitle = "Check out\nMy Repos";
    var subTitle = "on GitHub";
    IconData icon = PersonalPortfolioIcons.github;

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