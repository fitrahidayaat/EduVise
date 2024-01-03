import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ForumProvider with ChangeNotifier {
  QuerySnapshot? data;

  ForumProvider() {
    loadData();
  }

  Future<void> loadData() async {
    data = await FirebaseFirestore.instance
        .collection('thread')
        .orderBy('timestamp', descending: true)
        .get();
    notifyListeners(); // Beri tahu Flutter bahwa `data` telah berubah
  }
}
