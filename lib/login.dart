import 'package:flutter/material.dart';
import 'package:helloworld/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth.dart';
import 'signup.dart';

class loginPage extends StatefulWidget {
  @override
  State<loginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<loginPage> {
  String? errorMessage = '';

  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Error: $errorMessage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[600],
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: Center(
          child: Text(
            'Nice to see you again',
            style: TextStyle(
              color: Color(0xff000000),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Text(
              "Email",
              style: TextStyle(
                color: Color(0xff060606),
                fontSize: 10.0,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter your email',
                fillColor: Colors.white,
                filled: true,
              ),
              controller: _controllerEmail,
            ),
            SizedBox(height: 16.0),
            Text(
              "Password",
              style: TextStyle(
                color: Color(0xff060606),
                fontSize: 10.0,
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Enter your password',
                fillColor: Colors.white,
                filled: true,
              ),
              controller: _controllerPassword,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                await signInWithEmailAndPassword();

                // Check if authentication was successful
                if (FirebaseAuth.instance.currentUser != null) {
                  // Password matches, navigate to the DashboardPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => dashboardPage()),
                  );
                } else {
                  // Handle unsuccessful login
                  setState(() {
                    errorMessage = 'Authentication failed';
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                minimumSize: Size(353, 53),
              ),
              child: Text(
                "Log in",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Don't have an account?",
              style: TextStyle(
                color: Color(0xff060606),
                fontSize: 12.0,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isLogin = !isLogin;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => signupPage()),
                );
              },
              child: Text(
                isLogin ? "Sign up now" : "Log in instead",
                style: TextStyle(
                  color: Color.fromARGB(255, 251, 251, 251),
                  fontSize: 12.0,
                ),
              ),
            ),
            _errorMessage(),
          ],
        ),
      ),
    );
  }
}
