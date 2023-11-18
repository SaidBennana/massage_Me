import 'package:flutter/material.dart';
import 'package:massage_app/Pages/Mas_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Mas_Screen(),
    );
  }
}
