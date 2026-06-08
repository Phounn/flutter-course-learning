import 'package:course_learning/views/login_page.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Course Learning',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: const Color.fromARGB(255, 58, 133, 183))),
      home: const LoginPage() 
    );
  }
}

