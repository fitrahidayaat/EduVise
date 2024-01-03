import 'package:eduvise/src/constants/colors.dart';
import 'package:eduvise/src/constants/sizes.dart';
import 'package:eduvise/src/features/authentication/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:eduvise/src/constants/text_strings.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart' as path;

class SignupForm extends StatefulWidget {
  const SignupForm({
    super.key,
  });

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isPasswordVisible = false;

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  Future<File> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    try {
      return File(pickedFile!.path);
    } catch (e) {
      rethrow;
    }
  }

  // ignore: non_constant_identifier_names
  String tprofile_picture = "Upload an image";
  // ignore: non_constant_identifier_names
  late File? profile_picture = null;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
      key: _form,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.fullname,
              validator: ValidationBuilder().maxLength(50).build(),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.person_rounded,
                  color: tFormColor,
                ),
                labelText: tFullName,
                border: const OutlineInputBorder(),
                labelStyle: GoogleFonts.poppins(
                  color: tSecondaryColor,
                  fontSize: 14,
                ),
                focusedBorder: const OutlineInputBorder(
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
              controller: controller.email,
              validator: ValidationBuilder().email().maxLength(50).build(),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.email_rounded,
                  color: tFormColor,
                ),
                labelText: tEmail,
                border: const OutlineInputBorder(),
                labelStyle: GoogleFonts.poppins(
                  color: tSecondaryColor,
                  fontSize: 14,
                ),
                focusedBorder: const OutlineInputBorder(
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
              controller: controller.phoneNo,
              validator: ValidationBuilder().phone().build(),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.phone_android_rounded,
                  color: tFormColor,
                ),
                labelText: "Phone No",
                border: const OutlineInputBorder(),
                labelStyle: GoogleFonts.poppins(
                  color: tSecondaryColor,
                  fontSize: 14,
                ),
                focusedBorder: const OutlineInputBorder(
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
              controller: controller.password,
              validator: ValidationBuilder().minLength(8).maxLength(50).build(),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.lock_rounded,
                  color: tFormColor,
                ),
                labelText: tPassword,
                border: const OutlineInputBorder(),
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
            Row(
              children: [
                Text(
                  tprofile_picture,
                  style: GoogleFonts.poppins(
                    color: tSecondaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () async {
                    final pickedFile = await pickImage();
                    setState(() {
                      tprofile_picture = path.basename(pickedFile.path);
                      if (tprofile_picture.length > 20) {
                        tprofile_picture =
                            "${tprofile_picture.substring(0, 20)}...";
                      }
                      profile_picture = File(pickedFile.path);
                    });
                  },
                  icon: const Icon(
                    Icons.add_a_photo_rounded,
                    color: tFormColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: tFormHeight - 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_form.currentState!.validate()) {
                    if (profile_picture != null) {
                      SignUpController.instance.registerUser(
                        controller.email.text.trim(),
                        controller.password.text.trim(),
                        profile_picture!,
                      );
                    } else {
                      Get.snackbar('Error', "Please upload an image",
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  }
                },
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
