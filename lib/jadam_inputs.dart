import 'package:flutter/material.dart';
import 'JMS.dart';
import 'JMW.dart';
import 'JLFFW.dart';
import 'JLFS.dart';
import 'JLFWG.dart';
import 'JLFM.dart';
import 'JLFO.dart';
import 'JLFCT.dart';
import 'dashboard.dart';

class JadamInputsPage extends StatefulWidget {
  @override
  _JadamInputsPageState createState() => _JadamInputsPageState();
}

class _JadamInputsPageState extends State<JadamInputsPage> {
  TextEditingController searchController = TextEditingController();
  List<String> items = [
    'JADAM Mineral Water',
    'JADAM Indigenous Microorganism Solution',
    'JADAM Liquid Fertilizer - Wild Grass',
    'JADAM Liquid Fertilizer - Strawberry',
    'JADAM Liquid Fertilizer - Oyster',
    'JADAM Liquid Fertilizer - Mackarel',
    'JADAM Liquid Fertilizer - Food Waste',
    'JADAM Liquid Fertilizer - Cherry Tomato',
  ];

  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = items;
  }

  void filterSearchResults(String query) {
    List<String> searchResults = [];
    if (query.isNotEmpty) {
      items.forEach((item) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          searchResults.add(item);
        }
      });
    } else {
      searchResults = List.from(items);
    }

    setState(() {
      filteredItems = searchResults;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd8ad0d),
      appBar: AppBar(
        backgroundColor: Color(0xffd8ad0d),
        title: Text('Dashboard'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: filterSearchResults,
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (BuildContext context, int index) {
                return buildContainer(
                  context,
                  filteredItems[index],
                  '${filteredItems[index]}',
                  getNextPage(filteredItems[index]),
                );
              },
            ),
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
              //notification button
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => nextPage),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.orange,
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

  Widget getNextPage(String label) {
    switch (label) {
      case 'JADAM Mineral Water':
        return JMWPage();
      case 'JADAM Indigenous Microorganism Solution':
        return JMSPage();
      case 'JADAM Liquid Fertilizer - Wild Grass':
        return JLFWGPage();
      case 'JADAM Liquid Fertilizer - Strawberry':
        return JLFSPage();
      case 'JADAM Liquid Fertilizer - Oyster':
        return JLFOPage();
      case 'JADAM Liquid Fertilizer - Mackarel':
        return JLFMPage();
      case 'JADAM Liquid Fertilizer - Food Waste':
        return JLFFWPage();
      case 'JADAM Liquid Fertilizer - Cherry Tomato':
        return JLFCTPage();
      default:
        return Container();
    }
  }
}
