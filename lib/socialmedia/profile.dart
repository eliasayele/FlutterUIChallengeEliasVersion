import 'package:flutter/material.dart';
import 'package:uichallengesflutter/socialmedia/call_action.dart';
import 'package:uichallengesflutter/socialmedia/profile_avatar.dart';
import 'package:uichallengesflutter/socialmedia/story_group.dart';
import 'package:uichallengesflutter/socialmedia/tab_view.dart';
import 'package:uichallengesflutter/socialmedia/top_info.dart';
import 'avatar_group.dart';

class Profile extends StatelessWidget {
  Profile(this.colour);
  final Color colour;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: colour,
        child: Column(
          children: [
            TopInfo(),
            AvatarGroup(),
            ProfileAvatar(),
            ActionCall(),
            StoryGroup(),
            TabView(),
          ],
        ),
      ),
    );
  }
}
