// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
              "Sign Up",
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 150,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(fontSize: 20),
                  filled: true),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(fontSize: 20),
                  filled: true),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              // ignore: prefer_const_constructors
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
                    onPressed: () {
                      Navigator.pushNamed(context, '/search');
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
