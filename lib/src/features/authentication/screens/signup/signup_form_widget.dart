import 'package:eduvise/src/constants/colors.dart';
import 'package:eduvise/src/constants/sizes.dart';
import 'package:eduvise/src/features/authentication/controllers/signup_controller.dart';
import 'package:eduvise/src/features/authentication/models/mahasiswa_model.dart';
import 'package:flutter/material.dart';
import 'package:eduvise/src/constants/text_strings.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
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

  GlobalKey<FormState> _form = GlobalKey<FormState>();

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
              controller: controller.email,
              validator: ValidationBuilder().email().maxLength(50).build(),
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
              controller: controller.phoneNo,
              validator: ValidationBuilder().phone().build(),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.phone_android_rounded,
                  color: tFormColor,
                ),
                labelText: "Phone No",
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
              controller: controller.password,
              validator: ValidationBuilder().minLength(8).maxLength(50).build(),
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
                onPressed: () {
                  if (_form.currentState!.validate()) {
                    final mahasiswa = MahasiswaModel(
                      fullName: controller.fullname.text.trim(),
                      email: controller.email.text.trim(),
                      phoneNo: controller.phoneNo.text.trim(),
                      password: controller.password.text.trim(),
                    );
                    SignUpController.instance.registerUser(
                      controller.email.text.trim(),
                      controller.password.text.trim(),
                    );
                    // SignUpController.instance.createMahasiswa(mahasiswa);
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
