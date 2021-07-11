import 'package:flutter/material.dart';

class ActionCall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Color(0xFF3898F3),
                ),
                onPressed: () {
                  print("Follow");
                },
                child: Text(
                  "Follow",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: Color(0xFFFFFFFF),
                ),
                onPressed: () {
                  print("Message");
                },
                child: Text(
                  "Message",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Icon(Icons.keyboard_arrow_down_rounded),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                    style: BorderStyle.solid,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.12),
                  ),
                ),
              ),
              onTap: () {
                print("More options");
              },
            ),
          ],
        ),
      ),
    );
  }
}
