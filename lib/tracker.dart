import 'package:flutter/material.dart';

class TrackerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[600],
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: Text('Tracker Page'),
      ),
      body: Center(
        child: Text('Content of Tracker Page'),
      ),
    );
  }
}
