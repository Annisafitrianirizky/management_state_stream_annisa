import 'package:flutter/material.dart';
import 'random_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'stream annisa',
      theme: ThemeData(
        primaryColor: Colors.amber,
      ),
      home: const RandomScreen(),
    );
  }
}
