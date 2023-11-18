import 'package:flutter/material.dart';

class Mas_Screen extends StatelessWidget {
  const Mas_Screen({super.key});
  static const String page_link = "Mas_Screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Image.asset(
            "images/logo.png",
            height: 24,
          ),
          SizedBox(
            width: 10,
          ),
          Text("MassageGo"),
        ]),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.exit_to_app))],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Writing your Massage",
                            disabledBorder: InputBorder.none),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("Send",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
