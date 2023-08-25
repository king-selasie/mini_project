import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_signup_flow_app/screens/homescreen.dart';
import 'package:login_signup_flow_app/screens/sign-in.dart';
import 'package:login_signup_flow_app/screens/WelcomeScreen.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/welcome', // Set the initial route to the welcome screen
      routes: {
        '/welcome': (context) => WelcomeScreen(), // Add the welcome screen route
        '/signin': (context) => const SignInscreen(),
        '/home': (context) => const HomeScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}

