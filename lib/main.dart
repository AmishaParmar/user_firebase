import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:user/firebase_options.dart';
import 'package:user/screens/phone_auth.dart';
import 'package:user/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      //home: const SplashScreen(),
      home: const PhoneAuth(),
    );
  }
}
