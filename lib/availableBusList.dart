// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AvailableBusListPage extends StatefulWidget {
  const AvailableBusListPage({Key? key}) : super(key: key);

  @override
  _AvailableBusListPageState createState() => _AvailableBusListPageState();
}

class _AvailableBusListPageState extends State<AvailableBusListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Travel Partner"),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text("Next available busses for your destination"),
          ],
        ),
      ),
    );
  }
}
