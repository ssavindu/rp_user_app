// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:busfinder_user/src/screens/login.dart';
import 'package:busfinder_user/src/screens/availableBusList.dart';
import 'package:busfinder_user/src/screens/search_page.dart';
import 'package:busfinder_user/src/screens/signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Find My Bus',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/search': (context) => SearchPage(),
        '/track': (context) => AvailableBusListPage(),
        '/signup': (context) => SignupPage(),
      },
      // home: AvailableBusListPage(),
      theme: ThemeData.dark(),
    );
  }
}
