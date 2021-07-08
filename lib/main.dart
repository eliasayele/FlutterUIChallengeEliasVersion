import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color mainColor = Color(0xFF232343);
  Color setColor = Color(0xFF353666);
  Color tileColor = Color(0xFF5355a2);
  Color boxColor = Color(0xFFBCBEDC);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainColor,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://randomuser.me/api/portraits/men/75.jpg"),
                  ),
                  Text(
                    "Wallet App",
                    style: TextStyle(color: Colors.white),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notification_important_rounded,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
            Text(
              "Total Balance",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 13.0,
            ),
            Text(
              "1632.55 \$",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 45.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 36, left: 16.0, right: 16.0),
                decoration: BoxDecoration(
                  color: setColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Recent Transactions",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 25),
                    Expanded(
                        child: ListView(
                      children: [
                        ListTile(
                          Icons.shopping_cart,
                          Colors.blue,
                          "Shopping",
                          "Buying new cloth",
                          13.66,
                        ),
                        ListTile(
                          Icons.shopping_cart,
                          Colors.pink,
                          "Shopping",
                          "Buying new cloth",
                          13.66,
                        ),
                        ListTile(
                          Icons.shopping_cart,
                          Colors.green,
                          "Shopping",
                          "Buying new cloth",
                          13.66,
                        ),
                        ListTile(
                          Icons.shopping_cart,
                          Colors.pink,
                          "Shopping",
                          "Buying new cloth",
                          13.66,
                        ),
                        ListTile(
                          Icons.shopping_cart,
                          Colors.orange,
                          "Shopping",
                          "Buying new cloth",
                          13.66,
                        ),
                        ListTile(
                          Icons.shopping_cart,
                          Colors.pink,
                          "Shopping",
                          "Buying new cloth",
                          13.66,
                        ),
                        ListTile(
                          Icons.shopping_cart,
                          Colors.indigo,
                          "Shopping",
                          "Buying new cloth",
                          13.66,
                        ),
                        ListTile(
                          Icons.shopping_cart,
                          Colors.pink,
                          "Shopping",
                          "Buying new cloth",
                          13.66,
                        ),
                        ListTile(
                          Icons.shopping_cart,
                          Colors.pink,
                          "Shopping",
                          "Buying new cloth",
                          13.66,
                        ),
                        ListTile(
                          Icons.shopping_cart,
                          Colors.pink,
                          "Shopping",
                          "Buying new cloth",
                          13.66,
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ListTile(
      IconData icon, Color color, String type, String title, double value) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 16.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: tileColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: Color(0xFFBCBEDC),
                  borderRadius: BorderRadius.circular(8.0)),
              child: Icon(
                icon,
                size: 32.0,
                color: color,
              ),
            ),
            SizedBox(
              width: 12.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    type,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "$value \$",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
