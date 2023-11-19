import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:massage_app/Pages/Welcome_Screen.dart';
import '../services/services_sign.dart';

class Mas_Screen extends StatefulWidget {
  const Mas_Screen({super.key});
  static const String page_link = "Mas_Screen";

  @override
  State<Mas_Screen> createState() => _Mas_ScreenState();
}

class _Mas_ScreenState extends State<Mas_Screen> {
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  final massageControlle = TextEditingController();

  late User curentUser;
  String? massage;

  @override
  void initState() {
    super.initState();
    getCourentUser();
  }

  void getCourentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        curentUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

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
        actions: [
          IconButton(
              onPressed: () async {
                _auth.signOut();
                await GoogleSignIn().signOut();
                Navigator.restorablePushNamed(
                    context, welcome_Screen.page_link);
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StreamBuilder(
                stream: _fireStore
                    .collection("massage")
                    .orderBy("time")
                    .snapshots(),
                builder: (context, snapShot) {
                  List<massageLine> All_Massages = [];

                  final massges = snapShot.data!.docs.reversed;

                  for (var massage in massges) {
                    final mas = massage.get("text");
                    final snderId = massage.get("senderId");
                    final emailUser = massage.get("user_email");
                    final text = massageLine(
                      email: emailUser,
                      massage: mas,
                      userId: snderId,
                      is_Curent_user: snderId == curentUser.uid,
                    );
                    All_Massages.add(text);
                  }

                  return Expanded(
                    child: ListView(
                      children: All_Massages,
                      reverse: true,
                    ),
                  );
                }),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: massageControlle,
                        onChanged: (value) {
                          massage = value;
                        },
                        decoration: InputDecoration(
                            hintText: "Writing your Massage",
                            disabledBorder: InputBorder.none),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _fireStore.collection("massage").add({
                        "text": massage,
                        "senderId": curentUser.uid,
                        "user_email": curentUser.email,
                        "time": FieldValue.serverTimestamp()
                      });
                      massageControlle.clear();
                    },
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

class massageLine extends StatelessWidget {
  const massageLine(
      {this.email, this.massage, this.userId, this.is_Curent_user, super.key});

  final String? email;
  final String? massage;
  final String? userId;
  final bool? is_Curent_user;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment:
            is_Curent_user! ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Text(
            '$email',
            style: TextStyle(color: Colors.black45),
          ),
          SizedBox(
            height: 5,
          ),
          Material(
            borderRadius: BorderRadius.only(
              topLeft:
                  is_Curent_user! ? Radius.circular(0) : Radius.circular(30),
              topRight:
                  is_Curent_user! ? Radius.circular(30) : Radius.circular(0),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            color: is_Curent_user! ? Colors.blue[900] : Colors.yellow[900],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                '$massage',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
