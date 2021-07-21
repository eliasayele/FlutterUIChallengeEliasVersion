import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:uichallengesflutter/fitnessapp/fitness_home.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var pages = [
    PageViewModel(
      title: "Welcome Sportycus",
      body:
          "Sportycus is your fitness app which schedule your traning and track your achivements",
      image: Center(
          child: Image.asset("assets/fitness/screen1.png", height: 175.0)),
      decoration: const PageDecoration(
        pageColor: Color(0xff192A56),
        bodyTextStyle: TextStyle(fontSize: 17, color: Colors.white),
        titleTextStyle: TextStyle(fontSize: 24, color: Colors.white),
      ),
    ),
    PageViewModel(
      title: "Title of first page",
      body:
          "Here you can write the description of the page, to explain something...",
      image: Center(
          child: Image.asset("assets/fitness/screen2.png", height: 175.0)),
      decoration: const PageDecoration(
        pageColor: Color(0xff192A56),
        bodyTextStyle: TextStyle(fontSize: 17, color: Colors.white),
        titleTextStyle: TextStyle(fontSize: 24, color: Colors.white),
      ),
    ),
    PageViewModel(
      title: "Title of first page",
      body:
          "Here you can write the description of the page, to explain something...",
      image: Center(
          child: Image.asset("assets/fitness/screen3.png", height: 175.0)),
      decoration: const PageDecoration(
        pageColor: Color(0xff192A56),
        bodyTextStyle: TextStyle(fontSize: 17, color: Colors.white),
        titleTextStyle: TextStyle(fontSize: 24, color: Colors.white),
      ),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: pages,
        onDone: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => FitnessHome(),
            ),
          );
          // When done button is press
        },
        onSkip: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const FitnessHome(),
            ),
          );
        },
        showSkipButton: true,
        skip: const Icon(Icons.navigate_before),
        next: const Icon(Icons.navigate_next),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Colors.deepOrange,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
      ),
    );
  }
}
