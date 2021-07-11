import 'package:flutter/material.dart';
import 'package:uichallengesflutter/socialmedia/utils/constants.dart';

class ProfileAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Piero Borgo",
              style: kProfileAvatarNameStyle,
            ),
            Text(
              "Product Designer, Founder of Leevia, Lego bricks lover.",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(
              "leevia.com",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(color: Colors.blueAccent),
            ),
          ],
        ),
      ),
    );
  }
}
