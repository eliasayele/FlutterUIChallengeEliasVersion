import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uichallengesflutter/glasmorphism/glass_home.dart';
import 'package:uichallengesflutter/landingUi/LandingPage.dart';
import 'package:uichallengesflutter/netflix/netflix_home.dart';
import 'package:uichallengesflutter/socialmedia/main.dart';
import 'package:uichallengesflutter/walletapp/walletapp.dart';

import 'firebaseapp/firebase_login.dart';
import 'fitnessapp/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListChallenges(),
    );
  }
}

class ListChallenges extends StatelessWidget {
  const ListChallenges({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.indigo,
        title: Text("List of Challenges"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListApps(
                  icon: Icons.wallet_giftcard,
                  color: Colors.blue,
                  type: "Wallet App",
                  route: HomePage(),
                ),
                ListApps(
                  icon: Icons.face,
                  color: Colors.pink,
                  type: "social media",
                  route: ProfileScreen(),
                ),
                ListApps(
                  icon: Icons.video_call,
                  color: Colors.green,
                  type: "Netflix",
                  route: NetFlixHome(),
                ),
                ListApps(
                  color: Colors.pink,
                  icon: Icons.image,
                  route: LandingUI(),
                  type: "landing page",
                ),
                ListApps(
                  color: Colors.orangeAccent,
                  icon: Icons.fitness_center,
                  route: OnboardingScreen(),
                  type: "Fitness App",
                ),
                ListApps(
                  color: Colors.tealAccent,
                  icon: Icons.window,
                  route: GlassMorphismDemo(),
                  type: "Glass morphism demo app",
                ),
                ListApps(
                  color: Colors.tealAccent,
                  icon: Icons.account_box,
                  route: FirebaseLogin(),
                  type: "Firebase login sample",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListApps extends StatelessWidget {
  const ListApps(
      {Key? key,
      required this.icon,
      required this.route,
      required this.type,
      required this.color})
      : super(key: key);

  final IconData icon;
  final Color color;
  final String type;
  final Widget route;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => route),
        );
      },
      splashColor: Color(0xFFBCBEDC),
      child: Container(
        margin: EdgeInsets.only(bottom: 16.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: Color(0xFFBCBEDC),

                  ///fav color
                  borderRadius: BorderRadius.circular(8.0)),
              child: Icon(
                icon,
                size: 32.0,
                color: color,
              ),
            ),
            SizedBox(
              width: 12.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    type,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
