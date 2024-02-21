import 'package:flutter/material.dart';

class MyCropPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: Text('My Crop Page'),
      ),
      body: Center(
        child: Text('Content of My Crop Page'),
      ),
    );
  }
}
