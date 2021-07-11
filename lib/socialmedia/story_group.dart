import 'package:flutter/material.dart';

import 'avatar_text.dart';

class StoryGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, bottom: 10.0),
      child: Row(
        children: [
          AvatarWithText(
            title: "Story 1",
            avatarImage: AssetImage("assets/images/story_flower.png"),
          ),
          SizedBox(
            width: 20,
          ),
          AvatarWithText(
            title: "Story 2",
            avatarImage: AssetImage("assets/images/story_beach.png"),
          ),
          SizedBox(
            width: 16,
          ),
          AvatarWithText(
            title: "Story 3",
            avatarImage: AssetImage("assets/images/story_sky.png"),
          ),
        ],
      ),
    );
  }
}
