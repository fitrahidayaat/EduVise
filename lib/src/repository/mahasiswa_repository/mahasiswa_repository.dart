import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduvise/src/features/authentication/models/mahasiswa_model.dart';
import 'package:eduvise/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MahasiswaRepository extends GetxController {
  static MahasiswaRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createMahasiswa(MahasiswaModel mahasiswa) async {
    await _db
        .collection("Mahasiswa")
        .add(mahasiswa.toJson())
        .whenComplete(
          () => () => Get.snackbar("success", "Your account has been created",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green),
        )
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }
}
