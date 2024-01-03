import 'package:eduvise/src/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:eduvise/src/features/authentication/screens/signup/signup_form_widget.dart';
import 'package:eduvise/src/features/authentication/screens/signup/signup_header_widget.dart';
import 'package:eduvise/src/features/authentication/screens/signup/signup_footer_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SignupHeaderWidget(size: size),
                const SignupForm(),
                const SignupFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
