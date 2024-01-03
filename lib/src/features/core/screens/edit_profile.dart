import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduvise/src/constants/colors.dart';
import 'package:eduvise/src/features/core/providers/forum_provider.dart';
import 'package:eduvise/src/features/core/providers/profile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, required this.data});
  final data;
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  Future<File> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    try {
      return File(pickedFile!.path);
    } catch (e) {
      rethrow;
    }
  }

  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  // ignore: non_constant_identifier_names
  String tprofile_picture = "Upload new image";
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  late File? profile_picture = null;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Edit Profile",
            style: GoogleFonts.poppins(
              color: tSecondaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: tSecondaryColor),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 18.0),
            child: Form(
              key: _form,
              child: Column(
                children: [
                  Text(
                    "Edit your profile",
                    style: GoogleFonts.poppins(
                      color: tSecondaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: fullname,
                    validator: ValidationBuilder().maxLength(50).build(),
                    decoration: InputDecoration(
                      labelText: "Name",
                      border: const OutlineInputBorder(),
                      labelStyle: GoogleFonts.poppins(
                        color: tSecondaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: tSecondaryColor,
                        ),
                      ),
                      suffixIconColor: Colors.grey,
                    ),
                    style: GoogleFonts.poppins(
                      color: tSecondaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    cursorColor: tFormColor,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: phone,
                    validator: ValidationBuilder().phone().build(),
                    decoration: InputDecoration(
                      labelText: "Phone No",
                      border: const OutlineInputBorder(),
                      labelStyle: GoogleFonts.poppins(
                        color: tSecondaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: tSecondaryColor,
                        ),
                      ),
                      suffixIconColor: Colors.grey,
                    ),
                    style: GoogleFonts.poppins(
                      color: tSecondaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    cursorColor: tFormColor,
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () async {
                      final pickedFile = await pickImage();
                      setState(() {
                        tprofile_picture = path.basename(pickedFile.path);
                        profile_picture = File(pickedFile.path);
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          tprofile_picture,
                          style: GoogleFonts.poppins(
                            color: tSecondaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Icon(
                          Icons.add_a_photo_rounded,
                          color: tFormColor,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_form.currentState!.validate()) {
                          if (profile_picture == null) {
                            Get.showSnackbar(
                              const GetSnackBar(
                                message: "Please upload an image",
                                duration: Duration(seconds: 5),
                              ),
                            );
                          } else {
                            Navigator.pop(context);
                            User? user = FirebaseAuth.instance.currentUser;
                            final file = File(profile_picture!.path);
                            final storageRef = FirebaseStorage.instance
                                .ref()
                                .child('images/${widget.data["email"]}/pp.jpg');
                            await storageRef.putFile(file);
                            // Get the download URL
                            String downloadURL =
                                await storageRef.getDownloadURL();
                            try {
                              await FirebaseFirestore.instance
                                  .collection('mahasiswa')
                                  .doc(user?.uid)
                                  .set({
                                'name': fullname.text,
                                'email': widget.data["email"],
                                'phone': phone.text,
                                'profile_picture':
                                    downloadURL // Store the download URL
                              });

                              FirebaseAuth.instance.currentUser!
                                  .updateDisplayName(fullname.text);
                              final threadList = await FirebaseFirestore
                                  .instance
                                  .collection("thread")
                                  .get();

                              for (var doc in threadList.docs) {
                                var data = doc.data();
                                if (data["mahasiswa_id"] == user!.uid) {
                                  data["name"] = fullname.text;
                                  await doc.reference.update(data);
                                }
                              }

                              final replyList = await FirebaseFirestore.instance
                                  .collection("replies")
                                  .get();

                              for (var doc in replyList.docs) {
                                var data = doc.data();
                                if (data["mahasiswa_id"] == user!.uid) {
                                  data["name"] = fullname.text;
                                  await doc.reference.update(data);
                                }
                              }

                              //
                            } catch (e) {
                              log('Failed to write to Firestore: $e');
                            }
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: tSecondaryColor,
                      ),
                      child: Text(
                        "Simpan",
                        style: GoogleFonts.poppins(
                          color: tWhiteColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
