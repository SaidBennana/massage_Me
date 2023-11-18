import 'package:flutter/material.dart';
import 'package:massage_app/widgats/buttonMaterial.dart';

class log_in_Screnn extends StatelessWidget {
  const log_in_Screnn({super.key});

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
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: (value) {},
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintText: "Enter Your Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 21),
            child: TextField(
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value) {},
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintText: "Enter Your Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          buttonMaterial(
              ColorBtn: Colors.black87, name: "Log In", press: () {}),
        ],
      ),
    );
  }
}
