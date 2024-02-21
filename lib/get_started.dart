import "package:flutter/material.dart";
import 'signup.dart';

class get_startedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: Center(child: Text('AgriTrack')), // Added title to the app bar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 160, // Adjust the size of the container as needed
              height: 160, // Adjust the size of the container as needed
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Color(0xffe4e4e4), // Set the border color
                  width: 2.0, // Set the border width
                ),
              ),
              child: Image(
                image: AssetImage('images/crop.jpg'),
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10.0), // Add spacing between image and text
            Container(
              width: 300, // Set the desired width for the text container
              child: const Text(
                "Cultivate Nature's Wealth",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign:
                    TextAlign.center, // Optional: Align text in the center
              ),
            ),
            const SizedBox(height: 10.0), // Add spacing between image and text
            Container(
              width: 300, // Set the desired width for the text container
              child: const Text(
                "Cultivate Nature's Wealth with Agritrack: Your Organic Journey, Tracked and Thriving!",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                textAlign:
                    TextAlign.center, // Optional: Align text in the center
              ),
            ),
            const SizedBox(height: 20.0), // Add spacing between text and button
            ElevatedButton(
              onPressed: () {
                // Navigate to the ThirdPage when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => signupPage()),
                ); // Add your button click logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.green[600], // Set the background color of the button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      80.0), // Set the button border radius
                ),
                minimumSize: Size(290, 60),
              ),
              child: Text("Get Started",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
