import 'package:eduvise/src/constants/colors.dart';
import 'package:eduvise/src/constants/image_strings.dart';
import 'package:eduvise/src/constants/sizes.dart';
import 'package:eduvise/src/constants/text_strings.dart';
import 'package:eduvise/src/features/authentication/screens/forget_password/forget_password_otp/forget_password_otp.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPasswordMailScreen extends StatefulWidget {
  const ForgetPasswordMailScreen({super.key});

  @override
  State<ForgetPasswordMailScreen> createState() =>
      _ForgetPasswordMailScreenState();
}

class _ForgetPasswordMailScreenState extends State<ForgetPasswordMailScreen> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                SizedBox(height: tDefaultSize * 4),
                Form(
                  key: _form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: const AssetImage(tDataSecurity),
                        height: size.height * 0.18,
                      ),
                      SizedBox(height: tDefaultSize - 10),
                      Text(
                        'Forget Password',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Enter your email to reset password',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: tDefaultSize - 10),
                      TextFormField(
                        validator: ValidationBuilder().email().build(),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.mail_outline_rounded,
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
                      ),
                      SizedBox(height: tDefaultSize - 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_form.currentState!.validate()) {
                              Get.to(() => OTPScreen());
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: tSecondaryColor,
                          ),
                          child: Text(
                            'Next',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
