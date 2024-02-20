import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'inventory.dart';
import 'jadam_inputs.dart';
import 'tracker.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xffd8ad0d),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width *
              0.8, // Adjust the width as needed
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(60.0),
                child: Container(
                  height: 120,
                  width: 120,
                  child: CircleAvatar(
                      //backgroundImage: AssetImage('assets/profile_image.jpg'),
                      ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Color(0xffd8ad0d),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: Text(
                    'User Name',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              buildProfileOption(context, 'Tracker', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TrackerPage()),
                );
              }),
              buildProfileOption(context, 'Inventory', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InventoryPage()),
                );
              }),
              buildProfileOption(context, 'JADAM Inputs', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JadamInputsPage()),
                );
              }),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: buildYellowContainer('Sign Out', () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileOption(
      BuildContext context, String label, VoidCallback onTap) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: buildYellowContainer(label, onTap),
      ),
    );
  }

  Widget buildYellowContainer(String label, VoidCallback onTap) {
    return Container(
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Color(0xffd8ad0d),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ListTile(
        title: Center(
          child: Text(label),
        ),
        onTap: onTap,
      ),
    );
  }
}
