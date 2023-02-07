
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:main_cluesnew/Maps/map.dart';

class map extends StatefulWidget {
  map({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _mapState createState() => _mapState();
}

class _mapState extends State<map> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Maps"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            const Text(
              'Welcome to Google Maps Application',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MapsPage()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.near_me),
      ),
    );
  }
}
