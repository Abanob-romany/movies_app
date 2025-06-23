import 'dart:async';
import 'package:flutter/material.dart';
import '../../colors/app_colors.dart';
import '../onboarding_screens/screen_1.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Screen1(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 121,
          height: 118,
        ),
      ),
    );
  }
}
