import 'package:flutter/material.dart';

class MyCropPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd8ad0d),
      appBar: AppBar(
        backgroundColor: Color(0xffd8ad0d),
        title: Text('My Crop Page'),
      ),
      body: Center(
        child: Text('Content of My Crop Page'),
      ),
    );
  }
}
