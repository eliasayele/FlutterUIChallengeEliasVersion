import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailPassSignupScreen extends StatefulWidget {
  const EmailPassSignupScreen({Key? key}) : super(key: key);

  @override
  _EmailPassSignupScreenState createState() => _EmailPassSignupScreenState();
}

class _EmailPassSignupScreenState extends State<EmailPassSignupScreen> {
  final primaryColor = Color(0xFF00F58D);
  final secondaryColor = Color(0xFF006572);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void _signUpWithEmail() {
    String password = _passwordController.text.toString();
    String email = _emailController.text.toString();
    if (password.isNotEmpty && email.isNotEmpty) {
      _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("You are registered successfully"),
                )),
                Future.delayed(Duration(seconds: 2), () {
                  Navigator.of(context).pop();
                }),
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
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: Text("Email Sign up"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
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
                  _signUpWithEmail();
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
                      "Sign up With Email",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
