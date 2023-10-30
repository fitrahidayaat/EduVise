import 'package:eduvise/src/constants/colors.dart';
import 'package:eduvise/src/constants/image_strings.dart';
import 'package:eduvise/src/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:eduvise/src/constants/text_strings.dart';
import 'package:eduvise/src/features/authentication/screens/login/login_form_widget.dart';
import 'package:eduvise/src/features/authentication/screens/login/login_header_widget.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () {},
            child: Text.rich(
              TextSpan(
                text: tDontHaveAccount,
                style: Theme.of(context).textTheme.bodyMedium,
                children: const [
                  TextSpan(
                    text: tSignUp,
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
