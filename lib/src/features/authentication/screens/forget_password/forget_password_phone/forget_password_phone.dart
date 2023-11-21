import 'package:eduvise/src/constants/colors.dart';
import 'package:eduvise/src/constants/image_strings.dart';
import 'package:eduvise/src/constants/sizes.dart';
import 'package:eduvise/src/constants/text_strings.dart';
import 'package:eduvise/src/features/authentication/screens/forget_password/forget_password_otp/forget_password_otp.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPasswordPhoneScreen extends StatefulWidget {
  const ForgetPasswordPhoneScreen({super.key});

  @override
  State<ForgetPasswordPhoneScreen> createState() =>
      _ForgetPasswordPhoneScreenState();
}

class _ForgetPasswordPhoneScreenState extends State<ForgetPasswordPhoneScreen> {
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
                Column(
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
                      'Enter your phone number to reset password',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: tDefaultSize - 10),
                    Form(
                      key: _form,
                      child: TextFormField(
                        validator: ValidationBuilder().phone().build(),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.phone_android_outlined,
                            color: tFormColor,
                          ),
                          labelText: tPhoneNo,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
