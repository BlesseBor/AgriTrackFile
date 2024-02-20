import 'package:flutter/material.dart';
import 'dashboard.dart';

class JLFOPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd8ad0d),
      appBar: AppBar(
        backgroundColor: Color(0xffd8ad0d),
        title: Text('JMS'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context)
              .size
              .width, // Set container width to screen width
          padding:
              EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
          child: Column(
            children: [
              _buildContainer(
                context,
                'Ingredients',
                [
                  'Starter: Leaf mold 0.5 kg (1.1 lb)',
                  'Medium: Boiled potato 1 kg (2.2 lb) + sea salt 0.5 kg (1.1 lb)',
                  'Additional Diversity: Blend 1 kg of crop leaves and fruits, wild grass, and add to the solution as a medium.',
                ],
              ),
              SizedBox(height: 20), // Add some spacing between containers
              _buildContainer(
                context,
                'Equipment',
                [
                  'Plastic container with lid',
                  '2 socks or cotton bags',
                  '2 rocks',
                  'Stick',
                  'String',
                  'For heated cultivation: Heater and insulation'
                ],
              ),
              SizedBox(height: 20), // Add some spacing between containers
              _buildContainer(
                context,
                'Instructions',
                [
                  '1. Adjust the quantities of the starter and medium based on the desired volume (500 L, 132 gal). Variation in quantities is acceptable; you can increase potatoes if needed',
                  '2. The resulting 500 L (132 gal) of JMS can be diluted with water for use in an area ranging from 0.1 to 3.3 ha (0.25-8.2 ac)',
                  '3. Before applying on soil or plants, filter the JMS through a fine net.',
                  '4. n cold periods where water temperature falls below 18 (degrees)C (64.4 (degrees)F, use heaters.',
                  '5. The fermentation process takes different duration based on temperature:',
                  '- 24 hours at 28(degrees)C (82.4(degrees)F)',
                  '- 72 hours at 25(degrees)C (77(degrees)F)',
                  '- 96 hours at 19(degrees)C (66.2(degrees)F)'
                ],
              ),
            ],
          ),
        ),
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
          )
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pop(context);
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => dashboardPage()),
              );
              break;
            case 2:
              // Handle notification button tap
              break;
            case 3:
              // Handle calendar button tap
              break;
          }
        },
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          // Add the functionality you want when the button is pressed
        },
        child: Text('Add to Personal List'),
      ),
    );
  }

  Widget _buildContainer(
      BuildContext context, String title, List<String> instructions) {
    // Additional parameter added
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width *
          0.9, // Set container width to 90% of screen width
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: 10.0),
          // Loop through instructions and display each one
          for (var instruction in instructions)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  instruction,
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 10.0),
              ],
            ),
        ],
      ),
    );
  }
}
