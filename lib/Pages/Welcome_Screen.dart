import 'package:flutter/material.dart';
import 'package:massage_app/Pages/logIn_Screen.dart';
import 'package:massage_app/Pages/regastre_Page.dart';
import 'package:massage_app/widgats/buttonMaterial.dart';

class welcome_Screen extends StatelessWidget {
  const welcome_Screen({super.key});
  static const String page_link = "welcome_Screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            "images/logo.png",
            width: 200,
            height: 200,
          ),
          Center(
            child: Text(
              "Massage GO",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          buttonMaterial(
            ColorBtn: Colors.blue[900]!,
            name: "Log In",
            onPresse: () =>
                Navigator.pushNamed(context, log_in_Screnn.page_link),
          ),
          SizedBox(
            height: 20,
          ),
          buttonMaterial(
            ColorBtn: Colors.yellow[900]!,
            name: "Sign In",
            onPresse: () {
              Navigator.pushNamed(context, regaster_Screen.page_Link);
            },
          ),
        ],
      ),
    );
  }
}
