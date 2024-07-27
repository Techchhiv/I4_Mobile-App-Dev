import 'dart:async';

import 'package:final_projcct/welcome_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

   @override
  void initState() {
    super.initState();
    // Example: Navigating to another page after 3 seconds
    navigateToNextPage(context); // Pass context here
  }
   void navigateToNextPage(BuildContext context) {
    // Delay for 3 seconds
    const delay = Duration(seconds: 3);
    Timer(delay, () {
      // Navigate to another page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Welcome()),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ Color(0xFF242C3C),Color(0xFF4D5D7A)],
            stops: [0.3,1],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  
                  border: Border.all(color: Colors.grey, width: 1),
                  shape: BoxShape.circle,
                ),
                child: Image.asset('assets/images/logo.png')
              )
            ],
          ),
        ),
      )
    );
  }
}