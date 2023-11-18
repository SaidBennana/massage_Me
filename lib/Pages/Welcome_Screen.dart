import 'package:flutter/material.dart';

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Material(
              borderRadius: BorderRadius.circular(100),
              child: MaterialButton(
                onPressed: () {},
                height: 45,
                child: Text(
                  "Sign in",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.yellow[900],
                hoverColor: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
