import 'package:eduvise/src/constants/colors.dart';
import 'package:eduvise/src/features/core/providers/profile_provider.dart';
import 'package:eduvise/src/features/core/widgets/profile_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(
            color: tSecondaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        // elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Provider.of<ProfileProvider>(context, listen: false)
              .fetchData(FirebaseAuth.instance.currentUser!.uid);
          await Provider.of<ProfileProvider>(context, listen: false).getImage();
        },
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Consumer<ProfileProvider>(
              builder: (context, profileProvider, child) {
                if (profileProvider.userData == null ||
                    profileProvider.profilePicture == null) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    child: CircularProgressIndicator(color: tPrimaryColor),
                  );
                } else {
                  return ProfileWidget(data: profileProvider.userData);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
