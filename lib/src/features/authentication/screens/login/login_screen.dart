import 'package:eduvise/src/constants/colors.dart';
import 'package:eduvise/src/constants/image_strings.dart';
import 'package:eduvise/src/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:eduvise/src/constants/text_strings.dart';
import 'package:eduvise/src/features/authentication/screens/login/login_form_widget.dart';
import 'package:eduvise/src/features/authentication/screens/login/login_header_widget.dart';
import 'package:eduvise/src/features/authentication/screens/login/login_footer_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginHeaderWidget(size: size),
                const LoginForm(),
                const LoginFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}