import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:massage_app/Pages/Mas_Screen.dart';
import 'package:massage_app/Pages/Welcome_Screen.dart';
import 'package:massage_app/Pages/logIn_Screen.dart';
import 'package:massage_app/Pages/regastre_Page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: _auth.currentUser != null
          ? Mas_Screen.page_link
          : welcome_Screen.page_link,
      routes: {
        welcome_Screen.page_link: (context) => welcome_Screen(),
        log_in_Screnn.page_link: (context) => log_in_Screnn(),
        regaster_Screen.page_Link: (context) => regaster_Screen(),
        Mas_Screen.page_link: (context) => Mas_Screen(),
      },
    );
  }
}
