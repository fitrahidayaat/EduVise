import 'package:eduvise/src/constants/colors.dart';
import 'package:eduvise/src/constants/image_strings.dart';
import 'package:eduvise/src/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:eduvise/src/constants/text_strings.dart';
import 'package:eduvise/src/features/authentication/screens/login/login_form_widget.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: const AssetImage(tLogo),
          height: size.height * 0.2,
        ),
        SizedBox(height: tDefaultSize - 10),
        Text(
          tLoginTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          tLoginSubtitle,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
