import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Buses'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
          child: Column(
            children: const [
              SizedBox(height: 40,),
              Text(
                  'Your Pickup Location',
                textAlign: TextAlign.left,
                textWidthBasis: TextWidthBasis.parent,
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Current GPS Location',
                    labelStyle: TextStyle(fontSize: 20),
                    filled: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
