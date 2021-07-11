import 'package:flutter/material.dart';

class TopInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Pieroborgo",
            style: (TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 25,
            )),
          ),
          // Container(child: ,),
          Spacer(),
          Image.asset("assets/icons/new-video.png"),
          SizedBox(
            width: 40,
          ),
          Image.asset("assets/icons/menu.png"),
        ],
      ),
    );
  }
}
