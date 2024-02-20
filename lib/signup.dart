import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import '../auth.dart'; // Import your authentication class here

class signupPage extends StatelessWidget {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> createUserWithEmailAndPassword(BuildContext context) async {
    try {
      // Check if the password is at least 6 characters
      if (_controllerPassword.text.length < 6) {
        // Display an error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Password must be at least 6 characters long'),
          ),
        );
        return;
      }

      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );

      // You can add code here to save the user details to the database
      // For simplicity, let's assume you have a Firestore database and use
      // the user's email as the document ID
      // Firestore.instance.collection('users').doc(_controllerEmail.text).set({
      //   'name': _controllerName.text,
      //   'email': _controllerEmail.text,
      // });

      // Navigate to the login page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => loginPage()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        // Display an error message for email already in use
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text('The email address is already in use by another account.'),
          ),
        );
      } else {
        // Handle other FirebaseAuthException cases
        print('Error creating user: $e');
      }
    }
  }

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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name",
                style: TextStyle(
                  color: Color(0xff060606),
                  fontSize: 10.0,
                )),
            TextField(
              controller: _controllerName,
              decoration: InputDecoration(
                labelText: 'Enter your name',
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(height: 16.0),
            Text("Email",
                style: TextStyle(
                  color: Color(0xff060606),
                  fontSize: 10.0,
                )),
            TextField(
              controller: _controllerEmail,
              decoration: InputDecoration(
                labelText: 'Enter your email',
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(height: 16.0),
            Text("Password",
                style: TextStyle(
                  color: Color(0xff060606),
                  fontSize: 10.0,
                )),
            TextField(
              controller: _controllerPassword,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Enter your password',
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => createUserWithEmailAndPassword(context),
              style: ElevatedButton.styleFrom(
                primary: Color(0xffdea317),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                minimumSize: Size(353, 53),
              ),
              child: Text(
                "Sign up",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text("Already have an account?",
                style: TextStyle(
                  color: Color(0xff060606),
                  fontSize: 12.0,
                )),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => loginPage()),
                );
              },
              child: Text("Log in now",
                  style: TextStyle(
                    color: Color(0xff124eb0),
                    fontSize: 12.0,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
