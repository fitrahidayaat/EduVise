import 'package:eduvise/src/constants/colors.dart';
import 'package:eduvise/src/features/core/widgets/forum_box.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:eduvise/src/features/core/screens/add_forum.dart';
import 'package:eduvise/src/features/core/providers/forum_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Forum extends StatelessWidget {
  const Forum({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Forum",
          style: GoogleFonts.poppins(
            color: tSecondaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        // elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddForum());
        },
        backgroundColor: tPrimaryColor,
        child: const Icon(Icons.add),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Provider.of<ForumProvider>(context, listen: false).loadData();
        },
        child: Consumer<ForumProvider>(
          builder: (context, dataProvider, child) {
            if (dataProvider.data == null) {
              return const Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: ListView.builder(
                itemCount: dataProvider.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot doc = dataProvider.data!.docs[index];
                  if (dataProvider.data!.docs.isEmpty) {
                    return Center(
                      child: Text(
                        "Forum is empty",
                        style: GoogleFonts.poppins(color: Colors.black45),
                      ),
                    );
                  }
                  return ForumBox(
                    doc: doc,
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
