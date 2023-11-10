import 'package:eduvise/src/constants/colors.dart';
import 'package:eduvise/src/constants/sizes.dart';
import 'package:eduvise/src/features/authentication/screens/forget_password/forget_password_options/forget_password_modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:eduvise/src/constants/text_strings.dart';
// import google fonts
import 'package:google_fonts/google_fonts.dart';

class SignupForm extends StatefulWidget {
  SignupForm({
    super.key,
  });

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isPasswordVisible = false;

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person_rounded,
                  color: tFormColor,
                ),
                labelText: tFullName,
                border: OutlineInputBorder(),
                labelStyle: GoogleFonts.poppins(
                  color: tSecondaryColor,
                  fontSize: 14,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: tSecondaryColor,
                  ),
                ),
              ),
              style: GoogleFonts.poppins(
                color: tSecondaryColor,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              cursorColor: tFormColor,
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email_rounded,
                  color: tFormColor,
                ),
                labelText: tEmail,
                border: OutlineInputBorder(),
                labelStyle: GoogleFonts.poppins(
                  color: tSecondaryColor,
                  fontSize: 14,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: tSecondaryColor,
                  ),
                ),
              ),
              style: GoogleFonts.poppins(
                color: tSecondaryColor,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              cursorColor: tFormColor,
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock_rounded,
                  color: tFormColor,
                ),
                labelText: tPassword,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
                labelStyle: GoogleFonts.poppins(
                  color: tSecondaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: tSecondaryColor,
                  ),
                ),
                suffixIconColor: Colors.grey,
              ),
              obscureText: isPasswordVisible,
              style: GoogleFonts.poppins(
                color: tSecondaryColor,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              cursorColor: tFormColor,
            ),
            const SizedBox(height: tFormHeight - 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: tSecondaryColor,
                ),
                child: Text(
                  tSignUp.toUpperCase(),
                  style: GoogleFonts.poppins(
                    color: tWhiteColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}