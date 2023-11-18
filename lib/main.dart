import 'package:flutter/material.dart';
import 'package:massage_app/Pages/Welcome_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: welcome_Screen(),
    );
  }
}
