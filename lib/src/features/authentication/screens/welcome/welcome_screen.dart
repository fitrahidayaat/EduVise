import 'package:eduvise/src/constants/colors.dart';
import 'package:eduvise/src/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:eduvise/src/constants/image_strings.dart';
import 'package:eduvise/src/constants/text_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage(tWelcomeScreen),
              height: 0.6 * height,
            ),
            Column(
              children: [
                Text(
                  tWelcomeTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  tWelcomeSubtitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(),
                      foregroundColor: tSecondaryColor,
                      side: BorderSide(
                        color: tSecondaryColor,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      tLogin.toUpperCase(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(),
                      foregroundColor: tWhiteColor,
                      backgroundColor: tSecondaryColor,
                      side: BorderSide(
                        color: tSecondaryColor,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      tSignUp.toUpperCase(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
