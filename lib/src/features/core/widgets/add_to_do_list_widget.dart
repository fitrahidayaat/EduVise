import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduvise/src/constants/colors.dart';
import 'package:eduvise/src/features/core/providers/todolist_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddToDoList extends StatefulWidget {
  const AddToDoList({super.key});

  @override
  State<AddToDoList> createState() => _AddToDoListState();
}

class _AddToDoListState extends State<AddToDoList> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: tSecondaryColor),
          title: Text(
            "Add Item",
            style: GoogleFonts.poppins(
              color: tSecondaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: tPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Post",
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
                onPressed: () async {
                  var userId = FirebaseAuth.instance.currentUser!.uid;
                  await FirebaseFirestore.instance.collection('toDoList').add({
                    'title': title.text,
                    'description': description.text,
                    'timestamp': FieldValue.serverTimestamp(),
                    'mahasiswa_id': userId,
                  });
                  Get.back();
                  Provider.of<ToDoListProvider>(context, listen: false)
                      .fetchData();
                },
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          child: Column(
            children: [
              TextField(
                controller: title,
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 20,
                cursorColor: tPrimaryColor,
                style: GoogleFonts.poppins(
                  color: tSecondaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                decoration: const InputDecoration(
                  hintText: "Title",
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: tPrimaryColor,
                    ), // This is the border color
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: tPrimaryColor,
                    ), // This is the border color when the TextFormField is focused
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
              ),
              TextField(
                controller: description,
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 20,
                cursorColor: tPrimaryColor,
                style: GoogleFonts.poppins(
                  color: tSecondaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                decoration: const InputDecoration(
                  hintText: "Description",
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: tPrimaryColor,
                    ), // This is the border color
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: tPrimaryColor,
                    ), // This is the border color when the TextFormField is focused
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
