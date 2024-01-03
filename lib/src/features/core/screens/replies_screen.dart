import 'dart:developer';

import 'package:eduvise/src/constants/colors.dart';
import 'package:eduvise/src/features/core/screens/add_replies.dart';
import 'package:eduvise/src/features/core/widgets/replies_box.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeago/timeago.dart' as timeago;

class RepliesScreen extends StatefulWidget {
  const RepliesScreen({
    super.key,
    required this.doc,
  });
  final DocumentSnapshot doc;

  @override
  State<RepliesScreen> createState() => _RepliesScreenState();
}

class _RepliesScreenState extends State<RepliesScreen> {
  late Future<List<Map<String, dynamic>>> replies;

  @override
  void initState() {
    super.initState();
    replies = getReplies();
  }

  Future<List<Map<String, dynamic>>> getReplies() async {
    List<Map<String, dynamic>> repliesData = [];

    // Dapatkan DocumentSnapshot dari dokumen forum
    DocumentSnapshot forumDoc = await widget.doc.reference.get();

    if (forumDoc.exists) {
      var forumData = forumDoc.data();
      if (forumData is Map<String, dynamic>) {
        List<dynamic> repliesDynamic = forumData['replies'] ?? [];
        List<DocumentReference> replies =
            repliesDynamic.cast<DocumentReference>();

        for (var replyRef in replies) {
          DocumentSnapshot replyDoc = await replyRef.get();
          if (replyDoc.exists) {
            var data = replyDoc.data();
            if (data is Map<String, dynamic>) {
              repliesData.add(data);
            } else {
              log('Unexpected data format in document: $data');
            }
          }
        }
      } else {
        log('Unexpected data format in document: $forumData');
      }
    }

    return repliesData;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(color: tSecondaryColor),
          backgroundColor: Colors.white,
          title: Text(
            "Replies",
            style: GoogleFonts.poppins(
              color: tSecondaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: tPrimaryColor,
          onPressed: () {
            Get.to(() => AddReplies(doc: widget.doc));
          },
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        NetworkImage(widget.doc['profile_picture']),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      widget.doc['name'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    timeago.format(
                                        widget.doc['timestamp'].toDate()),
                                    style: const TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          widget.doc['description'],
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // make a line
            Container(
              height: 2,
              width: double.infinity,
              color: Colors.grey[400],
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder<List<Map<String, dynamic>>>(
              future: replies,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  if (snapshot.data!.isEmpty) {
                    return Center(
                      child: Text(
                        "No replies yet",
                        style: GoogleFonts.poppins(color: Colors.black45),
                      ),
                    );
                  }
                  return Expanded(
                    child: RefreshIndicator(
                      onRefresh: () {
                        setState(() {
                          replies = getReplies();
                        });
                        return replies;
                      },
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> doc = snapshot.data![index];
                          return RepliesBox(doc: doc);
                        },
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
