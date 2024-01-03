import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduvise/src/constants/colors.dart';
import 'package:eduvise/src/features/core/providers/todolist_provider.dart';
import 'package:eduvise/src/features/core/widgets/add_to_do_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: tSecondaryColor),
          title: Text(
            "To-Do List",
            style: GoogleFonts.poppins(
              color: tSecondaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => const AddToDoList());
          },
          backgroundColor: tPrimaryColor,
          child: const Icon(Icons.add),
        ),
        body: Consumer<ToDoListProvider>(
          builder: (context, provider, child) {
            if (provider.toDoList.isEmpty) {
              return Center(
                child: Text(
                  "To-Do List is empty",
                  style: GoogleFonts.poppins(color: Colors.black45),
                ),
              );
            }
            return RefreshIndicator(
              onRefresh: provider.fetchData,
              child: ListView.builder(
                itemCount: provider.toDoList.length,
                itemBuilder: (context, index) {
                  print(provider.toDoList.length);
                  return Card(
                    child: ListTile(
                      title: Text(
                        provider.toDoList[index]['title'],
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        provider.toDoList[index]['description'],
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () async {
                          // Dapatkan ID dokumen item yang akan dihapus
                          String docId = provider.toDoList[index]['id'];

                          // Hapus dokumen dari Firestore
                          await FirebaseFirestore.instance
                              .collection('toDoList')
                              .doc(docId)
                              .delete();

                          // Hapus item dari daftar lokal dan perbarui UI
                          provider.toDoList.removeAt(index);
                          provider.notifyListeners();
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
