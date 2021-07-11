import 'package:flutter/material.dart';
import 'package:uichallengesflutter/socialmedia/post.dart';
import 'image_avatar.dart';

class AvatarGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ImageAvatar(),
        Post(
          count: "210",
          type: "post",
        ),
        Post(
          count: "600",
          type: "follower",
        ),
        Post(
          count: "500",
          type: "following",
        ),
      ],
    );
  }
}
