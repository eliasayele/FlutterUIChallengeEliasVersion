import 'package:flutter/material.dart';

class LandingUI extends StatefulWidget {
  const LandingUI({Key? key}) : super(key: key);

  @override
  _LandingUIState createState() => _LandingUIState();
}

class _LandingUIState extends State<LandingUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF000000),
                    Color(0x00000000),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                ),
              ),
              child: Image(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                image: AssetImage("assets/images/smokegirl.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              //  width: MediaQuery.of(context).size.width,
              left: 20.0,
              bottom: 20.0,
              child: Container(
                //padding: EdgeInsets.all(20),
                // decoration: BoxDecoration(
                //   gradient: LinearGradient(
                //     colors: [
                //       Color(0xFF000000),
                //       Color(0x00000000),
                //     ],
                //     begin: Alignment.bottomCenter,
                //     end: Alignment.center,
                //   ),
                // ),
                width: MediaQuery.of(context).size.width,

                child: Column(
                  children: [
                    Text(
                      "25 AMAZING COLORFUL PHOTOGRAPHY",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ActionChip(
                          onPressed: () => {},
                          label: Text("PHOTOGRAPHY",
                              style: TextStyle(color: Colors.white)),
                          backgroundColor: Colors.red,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ActionChip(
                          onPressed: () => {},
                          label: Text(
                            "COLOR",
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.blue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
