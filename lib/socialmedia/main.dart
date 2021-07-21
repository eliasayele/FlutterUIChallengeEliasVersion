import 'package:flutter/material.dart';
import 'package:uichallengesflutter/socialmedia/profile.dart';

const iconsPath = 'assets/icons/';
const imagePath = 'assets/images/';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 0;
  final List<Widget> children = [
    Profile(Colors.blueGrey.shade50),
    Profile(Colors.white),
    Profile(Colors.white70),
    Profile(Colors.white70),
    Profile(Colors.white70),
  ];

  void onSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.lightBlue,
        currentIndex: _selectedIndex,
        fixedColor: Colors.black,
        unselectedItemColor: Colors.black,
        onTap: onSelected,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: "Video",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "Bag",
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Image.asset(
              "assets/images/avatar.png",
              width: 30,
              height: 30,
            ),
          )
        ],
      ),
    );
  }
}
