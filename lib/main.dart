import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'welcome_page.dart'; // Import your welcome page
import 'login_page.dart'; // Import your login page
import 'register_page.dart'; // Import your register page
import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(), // Start with the welcome page
      routes: {
        '/login': (context) => LoginPage(), // Define route for login page
        '/register': (context) =>
            RegisterPage(), // Define route for register page
        '/home': (context) => Home(), // Define route for home/dashboard page
      },
    );
  }
}
