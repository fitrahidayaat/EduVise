import 'package:eduvise/src/constants/image_strings.dart';
import 'package:eduvise/src/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:eduvise/src/constants/text_strings.dart';

class SignupHeaderWidget extends StatelessWidget {
  const SignupHeaderWidget({
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
          height: size.height * 0.18,
        ),
        SizedBox(height: tDefaultSize - 10),
        Text(
          tSignUpTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          tSignUpSubtitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
