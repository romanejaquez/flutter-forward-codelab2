import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WelcomePageService extends ChangeNotifier {

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  String name = '';
  String title1 = '';
  String title2 = '';
  String image = '';
  bool isDataRetrieved = false;

  List<String> greetings = [];
  int greetingsCounter = 0;
  String currentGreeting = '';


  Timer greetingsTimer = Timer(Duration.zero, () {});
  late AnimationController wavingAnimation;

  Future<bool> retrieveWelcomePageData() async {

    if (isDataRetrieved) {
      return true;
    }

    CollectionReference personalPortfolioCollection = firestore.collection('personal-portfolio');
    DocumentSnapshot pageDocument = await personalPortfolioCollection.doc('welcome-page').get();
    Map<String, dynamic> pageData = pageDocument.data() as Map<String, dynamic>;

    name = pageData['name'];
    title1 = pageData['title1'];
    title2 = pageData['title2'];
    image = pageData['image'];
    greetings = (pageData['greetings'] as List<dynamic>).map((e) => e.toString()).toList();

    currentGreeting = greetings[0];

    isDataRetrieved = true;
    return isDataRetrieved;
  }

  void initializeAnimation(TickerProvider provider) {
    wavingAnimation = AnimationController(vsync: provider,
    duration: const Duration(milliseconds: 500)
    )..repeat(reverse: true);
  }

  void initializeGreetings() {

    greetingsTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (greetingsCounter == greetings.length) {
        greetingsCounter = 0;
      }

      currentGreeting = greetings[greetingsCounter];
      greetingsCounter++;

      notifyListeners();
    });
  }

  @override
  void dispose() {
    disposeTimer();
    disposeAnimation();
    super.dispose();
  }

  void disposeAnimation() {
    wavingAnimation.dispose();
  }

  void disposeTimer() {
    greetingsTimer.cancel();
  }

  void refreshData() async {
    isDataRetrieved = await retrieveWelcomePageData();
    notifyListeners();
  }
}