import 'package:flutter/material.dart';

class FifthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffd8ad0d),
        appBar: AppBar(
          backgroundColor: Color(0xffd8ad0d),
          title: Center(
            child: Text('Get Started Now',
                style: TextStyle(
                  color: Color(0xff0d0d0d),
                )),
          ),
        ));
  }
}
