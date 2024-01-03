import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier {
  DocumentSnapshot? userData;
  String? profilePicture;

  ProfileProvider() {
    fetchData(FirebaseAuth.instance.currentUser!.uid);
    getImage();
  }

  Future<void> fetchData(String documentId) async {
    userData = await FirebaseFirestore.instance
        .collection('mahasiswa')
        .doc(documentId)
        .get();
    notifyListeners();
  }

  Future<void> getImage() async {
    profilePicture = await FirebaseStorage.instance
        .ref('images/${FirebaseAuth.instance.currentUser!.email}/pp.jpg')
        .getDownloadURL();
    notifyListeners();
  }
}
