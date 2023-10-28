import 'package:eduvise/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eduvise/src/features/authentication/screens/welcome/welcome_screen.dart';

class Onboarding extends StatefulWidget {
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
          },
          children: [
            Column(
              children: [
                const SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 75, 20, 0),
                  child: Image.asset(
                    "assets/images/onboarding1.png",
                    height: 250,
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  "Welcome to EduVise",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  "Begin your academic journey with Eduvise, your trusted learning companion.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 75, 20, 0),
                  child: Image.asset(
                    "assets/images/onboarding2.png",
                    height: 250,
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  "Customized Learning Support",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Tailor your study approach using Eduvise's chatbot, forums, and study plans..",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 75, 20, 0),
                  child: Image.asset(
                    "assets/images/onboarding3.png",
                    height: 250,
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  "Join Our Learning Community",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Join our learning community for support and inspiration. Get started with Eduvise today!",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                foregroundColor: Colors.white,
                backgroundColor: tPrimaryColor,
                minimumSize: const Size.fromHeight(80),
              ),
              child: Text(
                'Get Started',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onPressed: () async {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const WelcomeScreen(),
                  ),
                );
              },
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: Text(
                      "Skip",
                      style: GoogleFonts.poppins(
                          color: tPrimaryColor,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => controller.jumpToPage(2),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: WormEffect(
                        spacing: 20,
                        dotHeight: 12,
                        dotWidth: 12,
                        dotColor: Colors.black26,
                        activeDotColor: Colors.teal.shade700,
                      ),
                      onDotClicked: (index) => controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      ),
                    ),
                  ),
                  TextButton(
                    child: Text(
                      "Next",
                      style: GoogleFonts.poppins(
                        color: tPrimaryColor,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () => controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
