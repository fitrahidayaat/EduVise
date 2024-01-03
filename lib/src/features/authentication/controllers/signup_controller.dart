import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullname = TextEditingController();
  final phoneNo = TextEditingController();

  void registerUser(String email, String password, File pickedFile) async {
    try {
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = result.user;
      final file = File(pickedFile.path);
      final storageRef =
          FirebaseStorage.instance.ref().child('images/$email/pp.jpg');
      await storageRef.putFile(file);
      // Get the download URL
      String downloadURL = await storageRef.getDownloadURL();
      if (user != null) {
        await user.updateDisplayName(fullname.text);
        await user.updatePhotoURL(downloadURL);
      }
      try {
        await FirebaseFirestore.instance
            .collection('mahasiswa')
            .doc(user?.uid)
            .set({
          'name': fullname.text,
          'email': email,
          'phone': phoneNo.text,
          'profile_picture': downloadURL // Store the download URL
        });
      } catch (e) {
        log('Failed to write to Firestore: $e');
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.code.toString(),
          snackPosition: SnackPosition.BOTTOM);
      log('An error occurred: ${e.code}');
    }
  }
}
