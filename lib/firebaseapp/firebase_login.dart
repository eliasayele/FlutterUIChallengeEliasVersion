import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'email_pass_signup.dart';

class FirebaseLogin extends StatefulWidget {
  const FirebaseLogin({Key? key}) : super(key: key);

  @override
  _FirebaseLoginState createState() => _FirebaseLoginState();
}

class _FirebaseLoginState extends State<FirebaseLogin> {
  final primaryColor = Color(0xFF00F58D);
  final secondaryColor = Color(0xFF006572);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void _signIn() async {
    String password = _passwordController.text.toString();
    String email = _emailController.text.toString();
    if (password.isNotEmpty && email.isNotEmpty) {
      _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Login successfully"),
                )),
              })
          .catchError((e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.message),
        ));
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("please provide email and password"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(bottom: 80),
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 80),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x4400F58D),
                        blurRadius: 30,
                        offset: Offset(10, 10),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Image(
                      height: 200,
                      width: 200,
                      image: AssetImage("assets/taskapp/logo_round.png"))),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email",
                      hintText: "Write Email Here"),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Password",
                      hintText: "Write Password Here"),
                  obscureText: true,
                ),
              ),
              InkWell(
                onTap: () {
                  _signIn();
                },
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        primaryColor,
                        secondaryColor,
                      ]),
                      borderRadius: BorderRadius.circular(12)),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Center(
                    child: Text(
                      "Login With Email",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EmailPassSignupScreen()));
                  },
                  child: Text("Signup using Email")),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Wrap(
                  children: [
                    TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.mail_outline,
                          color: Colors.red,
                        ),
                        label: Text(
                          "Sign-In using Gmail",
                          style: TextStyle(color: Colors.red),
                        )),
                    TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.phone),
                        label: Text("Sign-In using phone")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
