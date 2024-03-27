import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import your light mode theme
import 'package:goat_farm_manager/themes/light_mode.dart';
import 'package:goat_farm_manager/auth/login_register.dart';

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
      home: LoginOrRegister(),
      theme: lightmode, // Set the theme to light mode
    );
  }
}
