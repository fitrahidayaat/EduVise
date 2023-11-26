import 'package:eduvise/src/constants/colors.dart';
import 'package:eduvise/src/constants/sizes.dart';
import 'package:eduvise/src/features/authentication/controllers/login_controller.dart';
import 'package:eduvise/src/features/authentication/controllers/signup_controller.dart';
import 'package:eduvise/src/features/authentication/screens/forget_password/forget_password_options/forget_password_modal_bottom_sheet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:eduvise/src/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_validator/form_validator.dart';

class LoginForm extends StatefulWidget {
  LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isPasswordVisible = false;

  // TextEditingController textEditingController = TextEditingController();

  GlobalKey<FormState> _form = GlobalKey<FormState>();

  void _validate() {
    _form.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: _form,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  fontWeight: FontWeight.normal,
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
              validator: ValidationBuilder().email().maxLength(50).build(),
              controller: controller.email,
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
                focusedBorder: OutlineInputBorder(
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
              validator: ValidationBuilder().minLength(8).maxLength(50).build(),
              controller: controller.password,
            ),
            const SizedBox(height: tFormHeight - 20),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ForgetPasswordScreen.buildShowModalBottomSheet(context);
                },
                child: const Text(tForgetPassword),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_form.currentState!.validate()) {
                    controller.login();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: tSecondaryColor,
                ),
                child: Text(
                  tLogin.toUpperCase(),
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
