import 'package:eduvise/firebase_options.dart';
import 'package:eduvise/src/features/core/providers/chats_provider.dart';
import 'package:eduvise/src/features/core/screens/dashboard.dart';
import 'package:eduvise/src/repository/authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eduvise/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:eduvise/src/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:eduvise/src/features/core/providers/models_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ModelsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
        theme: TAppTheme.lightTheme,
        home: const CircularProgressIndicator(),
      ),
    );
  }
}
