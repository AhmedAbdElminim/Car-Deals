import 'package:car_deals/features/onboarding_screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../shared/style/colors.dart';

class SplashScreen extends StatefulWidget {
  static const String splashScreenId = 'SplashScreenId';

  const SplashScreen({super.key});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));

    _controller.forward();

    _controller.addListener(() {
      if (_controller.isCompleted) {
        Navigator.pushReplacementNamed(
            context, OnBoardingScreen.onBoardingScreenId);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,
      body: Center(
        child: Lottie.asset('assets/images/splash/splash.json'),
      ),
    );
  }
}
