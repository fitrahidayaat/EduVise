import 'dart:developer';

import 'package:eduvise/src/constants/colors.dart';
import 'package:eduvise/src/features/core/screens/to_do_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'chat_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String greeting;

  @override
  void initState() {
    super.initState();

    var hour = DateTime.now().hour;

    if (hour < 12) {
      greeting = 'morning';
    } else if (hour < 17) {
      greeting = 'afternoon';
    } else {
      greeting = 'evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    var written = false;
    if (FirebaseAuth.instance.currentUser!.displayName == null) {
      return CircularProgressIndicator();
    }
    var name = FirebaseAuth.instance.currentUser!.displayName!.split(" ")[0];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Good $greeting, ${name}!",
                style: GoogleFonts.poppins(
                  color: tSecondaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 10.0,
                  backgroundColor: tWhiteColor,
                ),
                onPressed: () {
                  Get.to(() => ChatScreen(
                        written: written,
                      ));
                  written = true;
                },
                child: Container(
                  height: 100,
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        "assets/images/bot.png",
                        width: 75,
                      ),
                      Text(
                        'EduBot',
                        style: GoogleFonts.poppins(
                          color: tSecondaryColor,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 10.0,
                ),
                onPressed: () {
                  final user = FirebaseAuth.instance.currentUser;
                  FirebaseFirestore.instance
                      .collection('users')
                      .doc(user!.uid)
                      .get()
                      .then((DocumentSnapshot documentSnapshot) {
                    if (documentSnapshot.exists) {
                      log("hehe");
                    }
                  });
                  log("tes");
                  Get.to(() => const ToDoList());
                },
                child: SizedBox(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.list_alt_outlined,
                        size: 75,
                        color: Colors.black,
                      ),
                      Text(
                        'To-Do List',
                        style: GoogleFonts.poppins(
                          color: tSecondaryColor,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
