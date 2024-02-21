import 'package:flutter/material.dart';
import 'get_started.dart';
import 'widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyCI1wMTPuD9fGKFMv0lr4c-PVPzGfA4ErY',
      appId: '1:1057565295350:android:7ca2a222fc362b556d62d7',
      messagingSenderId: '1057565295350',
      projectId: 'agri-d38cc',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agritrack',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const WidgetTree(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 251, 251, 251),
      body: GestureDetector(
        onTap: () {
          // Navigate to the second page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => get_startedPage()),
          );
        },
        child: Center(
          child: Container(
            width: 160, // Adjust the size of the container as needed
            height: 160, // Adjust the size of the container as needed
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Color(0xffe4e4e4), // Set the border color
                width: 2.0, // Set the border width
              ),
            ),
            child: ClipOval(
              child: Image(
                image: AssetImage('images/crop.jpg'),
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
