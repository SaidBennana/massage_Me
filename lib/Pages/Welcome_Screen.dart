import 'package:flutter/material.dart';
import 'package:massage_app/widgats/buttonMaterial.dart';

class welcome_Screen extends StatelessWidget {
  const welcome_Screen({super.key});

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
              "Masssage GO",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          buttonMaterial(
            ColorBtn: Colors.yellow[900]!,
            name: "Sign In",
            press: () {},
          ),
          SizedBox(
            height: 20,
          ),
          buttonMaterial(
            ColorBtn: Colors.blue[900]!,
            name: "Log In",
            press: () {},
          )
        ],
      ),
    );
  }
}
