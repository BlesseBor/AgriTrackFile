import 'package:flutter/material.dart';
import 'dashboard.dart';

class JMWPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd8ad0d),
      appBar: AppBar(
        backgroundColor: Color(0xffd8ad0d),
        title: Text('JADAM Inputs Page'),
      ),
      body: SingleChildScrollView(
        child: _buildContainer(
          context,
          'JADAM Mineral Water',
          [
            '1. Utilize a large water container (marked as (1)) for natural mineral water. Fill 1/3 of a gunnysack with leaf mold, hang it in the container, and cover the bottom with rocks (20-30 cm). Change the leaf mold bag 1-2 times a year.',
            '2. After 2-3 days, the microbes in the leaf mold purify the water, turning it into excellent water. Use this water for cultivating microorganisms, irrigation, or applying pesticides.',
            '3. For irrigating liquid fertilizer and JMS mixed with water, prepare 1 ton (264 gal) of water for 0.1 ha (0.08 ac) and dilute accordingly (e.g., 1 t or 264 gal for a specific area).',
            '4. Adjust the volume of water using valve (2) and run the system with valves (3) and (4) open (holding liquid fertilizer or JMS). After liquid from (3) and (4) runs out, run the system with clean water from (1) for 5 minutes to clean hoses.',
            '5. Create a watering system with components: (1) water container, (2) valve for water volume control, (3) container for microorganism cultivation, (4) container for liquid fertilizer, (5) motored pump, (6) filter to prevent hose blockage, (7) valve for soil irrigation, (8) valve for ceiling sprinkler, (9) water level control, (10) water supply for (3) and (4), (11) filter made from felt for regular cleaning.'
          ],
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
          SizedBox(height: 12.0),
          // Loop through instructions and display each one
          for (var instruction in instructions)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  instruction,
                  style: TextStyle(
                    fontSize: 15.0,
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
