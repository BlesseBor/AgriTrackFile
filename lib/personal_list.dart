import 'package:flutter/material.dart';
import 'my_organic_input.dart';
import 'my_crop.dart';
import 'dashboard.dart';

class PersonalListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: Text('Personal List Page'),
      ),
      body: ListView(
        children: [
          buildContainer(
            context,
            'My Organic Input',
            'List of organic inputs created.',
            MyOrganicInputPage(),
          ),
          buildContainer(
            context,
            'My Crops',
            'List of crops that used organic inputs.',
            MyCropPage(),
          ),
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
        selectedItemColor: Colors.black, // Color for the selected icon
        unselectedItemColor: Colors.green[700], // Color for unselected icons
        onTap: (int index) {
          // Handle bottom navigation item tap
          switch (index) {
            case 0:
              // Handle back button tap
              Navigator.pop(context);
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => dashboardPage()),
              );
              // You can replace this with the actual destination screen
              break;
            case 2:
              // Handle notification button tap
              // You can replace this with the actual destination screen
              break;
            case 3:
              // Handle calendar button tap
              // You can replace this with the actual destination screen
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
        border: Border.all(color: Colors.green, width: 2),
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
              // Navigate to the respective page when the button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => nextPage),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[700],
              minimumSize: Size(100, 30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            child: Text(
              'View',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
