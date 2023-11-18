import 'package:flutter/material.dart';
import 'package:massage_app/Pages/Mas_Screen.dart';
import 'package:massage_app/Pages/Welcome_Screen.dart';
import 'package:massage_app/Pages/logIn_Screen.dart';
import 'package:massage_app/Pages/regastre_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: welcome_Screen.page_link,
      routes: {
        welcome_Screen.page_link: (context) => welcome_Screen(),
        log_in_Screnn.page_link: (context) => log_in_Screnn(),
        regaster_Screen.page_Link: (context) => regaster_Screen(),
        Mas_Screen.page_link: (context) => Mas_Screen(),
      },
    );
  }
}
