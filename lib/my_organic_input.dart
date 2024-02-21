import 'package:flutter/material.dart';

class MyOrganicInputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: Text('My Organic Input Page'),
      ),
      body: Center(
        child: Text('Content of My Organic Input Page'),
      ),
    );
  }
}
