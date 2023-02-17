import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:roman_web_portfolio/helpers/colors.dart';
import 'package:roman_web_portfolio/helpers/personal_portfolio_icons_icons.dart';
import 'package:roman_web_portfolio/services/welcome_page_service.dart';

class WelcomePage extends StatefulWidget {
  static const String route = '/welcome';

  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with SingleTickerProviderStateMixin {

  late WelcomePageService serviceInstance;
  late Future<bool> retrieveData;

  @override
  void initState() {
    super.initState();

    // get a reference of the service using the context
    serviceInstance = context.read<WelcomePageService>();

    // invoke the initialization of the greetings
    serviceInstance.initializeAnimation(this);
    
    if (serviceInstance.isDataRetrieved) {
      serviceInstance.initializeGreetings();
    }
    else {
      serviceInstance.refreshData();
    }
}

@override
void dispose() {
    serviceInstance.disposeTimer();
    serviceInstance.disposeAnimation();
    super.dispose();
}
  
  @override
  Widget build(BuildContext context) {
    return Consumer<WelcomePageService>(
      builder: (context, welcomeService, child) {

        if (!welcomeService.isDataRetrieved) {
          return const SizedBox.shrink();
        }

        return Center(
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 100,
                            height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: PersonalPortfolioColors.mainBlue, width: 8),
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                                image: NetworkImage(
                                    welcomeService.image),
                                fit: BoxFit.cover))),
                        const SizedBox(width: 40),
                        RotationTransition(
                          alignment: Alignment.bottomCenter,
                          turns: Tween<double>(begin: -0.09, end: 0.005)
                          .animate(CurvedAnimation(parent: welcomeService.wavingAnimation, curve: Curves.easeInOut)),
                          
                          child: const Icon(PersonalPortfolioIcons.wave,
                              size: 90, color: PersonalPortfolioColors.lightBlue),
                        )
                    ]
                  ),
                  Text(welcomeService.currentGreeting, style: 
                    const TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    )
                  ),
                  Text.rich(
                    TextSpan(
                    style: const TextStyle(fontSize: 100, color: Colors.white),
                    children: [
                            const TextSpan(text: "I'm "),
                            TextSpan(
                                text: welcomeService.name, 
                                style: const TextStyle(fontWeight: FontWeight.bold)
                            ),
                        ]
                    ),
                    textAlign: TextAlign.center,
                ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                          PersonalPortfolioIcons.badge,
                          color: PersonalPortfolioColors.lightBlue,
                          size: 80
                      ),
                      const SizedBox(width: 20),
                      Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Text(welcomeService.title1, textAlign: TextAlign.center, style: TextStyle(fontSize: 40, color: Colors.white)),
                              Text(welcomeService.title2, textAlign: TextAlign.center, style: TextStyle(fontSize: 40, color: Colors.white)),
                          ],
                      )
                    ]
                  )
                ]
              )
        );
      }
    );
  }
}
