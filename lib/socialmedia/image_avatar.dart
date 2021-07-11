import 'package:flutter/material.dart';

class ImageAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
        image: AssetImage("assets/images/avatar.png"),
      ),
    );
  }
}
