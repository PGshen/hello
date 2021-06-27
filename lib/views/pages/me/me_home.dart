import 'package:flutter/material.dart';

class MeHome extends StatefulWidget {
  @override
  _MeHomeState createState() => _MeHomeState();
}

class _MeHomeState extends State<MeHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Me', textScaleFactor: 5,),
      ),
    );
  }

}