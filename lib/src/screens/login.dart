// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'dart:developer';

import 'package:busfinder_user/src/services/auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController errorLableController = TextEditingController();

  String errorMessage = "";
  bool isValidEmail(String emailAddress) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(emailAddress);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find My bus'),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text(
              "Login",
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 150,
            ),
            Text(
              errorMessage,
              style: TextStyle(fontSize: 25, color: Colors.red),
              textAlign: TextAlign.center,
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(fontSize: 20),
                  filled: true),
              validator: (value) {
                if (value == null || value.isEmpty || !isValidEmail(value)) {
                  return 'Please enter valid Email';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(fontSize: 20),
                filled: true,
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Password';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: <Widget>[
                ButtonTheme(
                  height: 50,
                  disabledColor: Colors.blueAccent,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                        primary: Colors.green[800]),
                    onPressed: () async {
                      final String email = emailController.text;
                      final String password = passwordController.text;
                      print(email);
                      print(password);
                      String res = await authTest("$email", "$password");
                      print(res);
                      if (res == 'denied') {
                        setState(() {
                          errorMessage = "Invalid Password";
                        });
                      } else if (res == 'no_user') {
                        setState(() {
                          errorMessage = "Invalid Username";
                        });
                      } else {
                        setState(() {
                          errorMessage = "";
                        });
                        Navigator.pushNamed(context, '/search');
                      }
                    },
                    child: Text(
                      'Login',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ButtonTheme(
                  height: 50,
                  disabledColor: Colors.blueAccent,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                        primary: Colors.green[800]),
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text(
                      'Sign Up',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
