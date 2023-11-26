import 'package:eduvise/src/features/authentication/models/mahasiswa_model.dart';
import 'package:eduvise/src/features/core/screens/dashboard.dart';
import 'package:eduvise/src/repository/authentication_repository/authentication_repository.dart';
import 'package:eduvise/src/repository/mahasiswa_repository/mahasiswa_repository.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullname = TextEditingController();
  final phoneNo = TextEditingController();

  final mahasiswaRepo = Get.put(MahasiswaRepository());

  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }

  Future<void> createMahasiswa(MahasiswaModel mahasiswa) async {
    await mahasiswaRepo.createMahasiswa(mahasiswa);
    phoneAuthentication(mahasiswa.phoneNo);
    Get.to(() => const Dashboard());
  }
}
