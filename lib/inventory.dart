import 'package:flutter/material.dart';

class InventoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[600],
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: Text('Inventory Page'),
      ),
      body: Center(
        child: Text('Content of Inventory Page'),
      ),
    );
  }
}
