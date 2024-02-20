import 'package:flutter/material.dart';
import 'package:helloworld/inventory.dart';
import 'package:helloworld/jadam_inputs.dart';
import 'package:helloworld/personal_list.dart';
import 'package:helloworld/tracker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helloworld/auth.dart';
import 'profile.dart';

class dashboardPage extends StatelessWidget {
  final User? user = Auth().currentUser;

  Widget _title() {
    return const Text('Firebase Auth');
  }

  Widget _userID() {
    return Text(user?.email ?? 'Firebase Auth');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd8ad0d),
      appBar: AppBar(
        backgroundColor: Color(0xffd8ad0d),
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          _userID(),
          buildContainer(
            context,
            'My Personal List',
            'Manage your completed and ongoing organic inputs.',
            PersonalListPage(),
          ),
          // Add a profile button before the Personal List container
          buildProfileButton(context),
          buildContainer(context, 'JADAM Inputs',
              'Step-by-step JADAM Input instructions', JadamInputsPage()),
          buildContainer(
              context, 'Inventory', 'View your JADAM inputs.', InventoryPage()),
          buildContainer(context, 'Tracker',
              'Keep track of your JADAM input application', TrackerPage()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: 'Back',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pop(context);
              break;
            case 1:
              //home button
              break;
            case 2:
              // notification button
              break;
            case 3:
              //calendar button
              break;
          }
        },
      ),
    );
  }

  Widget buildContainer(
      BuildContext context, String label, String description, Widget nextPage) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            description,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black54,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => nextPage),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              minimumSize: Size(100, 30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            child: Text(
              'Open',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  // Function to build the profile button
  Widget buildProfileButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Profile',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            'View and edit your profile information.',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black54,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              minimumSize: Size(100, 30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            child: Text(
              'Open Profile',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
