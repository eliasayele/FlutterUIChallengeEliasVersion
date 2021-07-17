import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uichallengesflutter/netflix/netflix_home.dart';
import 'package:uichallengesflutter/socialmedia/main.dart';
import 'package:uichallengesflutter/walletapp/walletapp.dart';

void main() {
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
      appBar: AppBar(
        title: Text("List of Challenges"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  title: TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      icon: Icon(Icons.wallet_giftcard),
                      label: Text("Wallet app")),
                ),
                ListTile(
                  title: TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()),
                        );
                      },
                      icon: Icon(Icons.face),
                      label: Text("social media app")),
                ),
                ListTile(
                  title: TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NetFlixHome()),
                        );
                      },
                      icon: Icon(Icons.play_circle_filled_rounded),
                      label: Text("netflix app")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
