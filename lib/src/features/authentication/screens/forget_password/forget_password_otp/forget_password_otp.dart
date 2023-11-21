import 'package:eduvise/src/constants/colors.dart';
import 'package:eduvise/src/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "CO\nDE",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 80,
                ),
              ),
              Text(
                "Verification",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 40),
              Text(
                "Enter the verification code sent at " + "support@gmail.com",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Form(
                child: OtpTextField(
                  numberOfFields: 6,
                  fillColor: Colors.black.withOpacity(0.1),
                  filled: true,
                  onSubmit: (code) {
                    print("OTP is => $code");
                  },
                  keyboardType: TextInputType.number,
                  cursorColor: tSecondaryColor,
                  focusedBorderColor: tSecondaryColor,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Next"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tSecondaryColor,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
