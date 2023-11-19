import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:massage_app/Pages/Mas_Screen.dart';
import 'package:massage_app/services/services_sign.dart';
import 'package:massage_app/widgats/buttonMaterial.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class regaster_Screen extends StatefulWidget {
  const regaster_Screen({super.key});

  static const String page_Link = "regaster_Screen";

  @override
  State<regaster_Screen> createState() => _regaster_ScreenState();
}

class _regaster_ScreenState extends State<regaster_Screen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String pass;
  bool showSpinar = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinar,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: "Enter Your Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 21),
                  child: TextField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (value) {
                      pass = value;
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: "Enter Your Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                buttonMaterial(
                    ColorBtn: Colors.black87,
                    name: "Sign In",
                    onPresse: () async {
                      setState(() {
                        showSpinar = true;
                      });
                      try {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: pass);

                        Navigator.pushNamed(context, Mas_Screen.page_link);
                        setState(() {
                          showSpinar = false;
                        });
                      } catch (e) {
                        print(e);
                        setState(() {
                          showSpinar = false;
                        });
                      }
                    }),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Or Continue With",
                  style: TextStyle(fontSize: 20, color: Colors.black54),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        await AuthServices().google_Sign_In();
                        Navigator.pushNamed(context, Mas_Screen.page_link);
                      },
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            "images/google.jpg",
                            width: 70,
                            height: 70,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
