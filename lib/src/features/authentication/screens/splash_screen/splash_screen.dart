import 'package:flutter/material.dart';
import 'package:eduvise/src/constants/image_strings.dart';
import 'package:eduvise/src/features/authentication/screens/onboarding/onboarding.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: AnimatedOpacity(
              opacity: animate ? 1 : 0,
              duration: const Duration(
                milliseconds: 3000,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() => animate = true);
    await Future.delayed(const Duration(milliseconds: 3000));
    //ignore: use_build_context_synchronously

    Get.to(() => const Onboarding());
  }
}
