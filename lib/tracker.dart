import 'package:flutter/material.dart';

class TrackerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd8ad0d),
      appBar: AppBar(
        backgroundColor: Color(0xffd8ad0d),
        title: Text('Tracker Page'),
      ),
      body: Center(
        child: Text('Content of Tracker Page'),
      ),
    );
  }
}
