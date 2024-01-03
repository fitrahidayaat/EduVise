import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:eduvise/src/constants/colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddReplies extends StatefulWidget {
  const AddReplies({super.key, required this.doc});
  final DocumentSnapshot doc;
  @override
  State<AddReplies> createState() => _AddRepliesState();
}

class _AddRepliesState extends State<AddReplies> {
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
                  backgroundColor: tPrimaryColor,
                  foregroundColor: Colors.black,
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
                  // Tambahkan reply baru
                  final docRef = await FirebaseFirestore.instance
                      .collection('replies')
                      .add({
                    'description': description.text,
                    'mahasiswa_id': userId,
                    'name': userData['name'],
                    'profile_picture': userData['profile_picture'],
                    'timestamp': FieldValue.serverTimestamp(),
                  });

                  // Dapatkan data dari dokumen forum
                  // Dapatkan data dari dokumen forum
                  var forumData = widget.doc.data();
                  if (forumData is Map<String, dynamic>) {
                    // Tambahkan DocumentReference dari reply baru ke dalam list replies
                    List<dynamic> repliesDynamic = forumData['replies'] ?? [];
                    print(repliesDynamic);
                    List<DocumentReference> replies =
                        repliesDynamic.cast<DocumentReference>();

                    print('Sebelum: $replies');
                    replies.add(docRef);
                    print('Setelah: $replies');

                    // Perbarui data pada dokumen forum
                    await widget.doc.reference.update({
                      'replies': FieldValue.arrayUnion([docRef])
                    });
                  } else {
                    // Handle the situation when forumData is not a Map
                  }

                  // ignore: use_build_context_synchronously
                  Get.back();
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
