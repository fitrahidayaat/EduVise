import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduvise/src/features/core/providers/forum_provider.dart';
import 'package:flutter/material.dart';
import 'package:eduvise/src/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class AddForum extends StatefulWidget {
  const AddForum({super.key});

  @override
  State<AddForum> createState() => _AddForumState();
}

class _AddForumState extends State<AddForum> {
  // make text form controller
  TextEditingController description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: tSecondaryColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
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
                  // add to firebase

                  // get the current user's id
                  var userId = FirebaseAuth.instance.currentUser!.uid;

                  // fetch the user data from the 'mahasiswa' collection
                  var userData = await FirebaseFirestore.instance
                      .collection('mahasiswa')
                      .doc(userId)
                      .get();

                  // add to firebase
                  // Buat DocumentReference
                  DocumentReference replyRef = FirebaseFirestore.instance
                      .collection('replies')
                      .doc('replyId');

                  // Tambahkan DocumentReference ke dalam list
                  List<DocumentReference> replies = [replyRef];

                  // Tambahkan data ke Firestore
                  FirebaseFirestore.instance.collection('thread').add({
                    'description': description.text,
                    'name': userData['name'],
                    'mahasiswa_id': userId,
                    'profile_picture': userData['profile_picture'],
                    'replies': replies,
                    'timestamp': FieldValue.serverTimestamp(),
                  });
                  // sleep for some time
                  // await Future.delayed(Duration(seconds: 1));
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);

                  // ignore: use_build_context_synchronously
                  Provider.of<ForumProvider>(context, listen: false).loadData();
                },
              ),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: TextField(
                  controller: description,
                  keyboardType: TextInputType.multiline,
                  minLines: 20,
                  maxLines: 20,
                  decoration: const InputDecoration(
                    hintText: 'Description',
                    border: InputBorder.none,
                  ),
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: tFormColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
