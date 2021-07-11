import 'package:flutter/material.dart';

class AvatarWithText extends StatelessWidget {
  AvatarWithText({required this.title, required this.avatarImage});
  final AssetImage avatarImage;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: Image(
              image: avatarImage,
              width: 70,
              height: 70,
            ),
          ),
          Text(title),
        ],
      ),
    );
  }
}
