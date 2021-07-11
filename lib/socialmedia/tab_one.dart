import 'package:flutter/material.dart';
import 'package:uichallengesflutter/socialmedia/utils/constants.dart';

class TabOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: 9,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2.0),
              child: Image(
                fit: BoxFit.cover,
                image:
                    AssetImage(kAssetImagePath + "user_post_${index + 1}.png"),
              ),
            ),
          );
        });
  }
}
