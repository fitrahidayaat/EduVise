import 'package:eduvise/src/constants/colors.dart';
import 'package:eduvise/src/constants/text_strings.dart';
import 'package:eduvise/src/features/authentication/controllers/signup_controller.dart';
import 'package:eduvise/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/profile_picture.png'),
          ),
          SizedBox(height: 20),
          Text(
            "tes",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                AuthenticationRepository.instance.logout();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: tSecondaryColor,
              ),
              child: Text(
                "SIGN OUT",
                style: GoogleFonts.poppins(
                  color: tWhiteColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
