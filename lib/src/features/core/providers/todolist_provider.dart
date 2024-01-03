import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ToDoListProvider extends ChangeNotifier {
  List<Map<String, dynamic>> toDoList = [];

  ToDoListProvider() {
    fetchData();
  }

  Future<void> fetchData() async {
    toDoList.clear();
    var userId = FirebaseAuth.instance.currentUser!.uid;
    var userData =
        await FirebaseFirestore.instance.collection('toDoList').get();
    for (var doc in userData.docs) {
      if (doc["mahasiswa_id"] == userId) {
        // Tambahkan ID dokumen ke data
        var data = doc.data();
        data['id'] = doc.id;
        toDoList.add(data);
      }
    }
    notifyListeners();
  }
}
