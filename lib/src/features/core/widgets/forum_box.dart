import 'package:eduvise/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:get/get.dart';
import 'package:eduvise/src/features/core/screens/replies_screen.dart';

class ForumBox extends StatefulWidget {
  const ForumBox({
    super.key,
    required this.doc,
  });
  final DocumentSnapshot doc;

  @override
  State<ForumBox> createState() => _ForumBoxState();
}

class _ForumBoxState extends State<ForumBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: tPrimaryColor,
            backgroundImage: NetworkImage(widget.doc['profile_picture']),
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
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Text(
                                widget.doc['name'],
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            timeago.format(widget.doc['timestamp'] != null
                                ? widget.doc['timestamp'].toDate()
                                : DateTime.now()),
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 3, 0, 0),
                  child: Text(
                    widget.doc['description'],
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => RepliesScreen(doc: widget.doc));
                  },
                  child: Text(
                    "Replies",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: tPrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
