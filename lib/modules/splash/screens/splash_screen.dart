import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/modules/splash/screens/intro_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "SplashScreen";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ZoomIn(
                duration: const Duration(seconds: 3),
                child: Center(
                  child: Image.asset("assets/logo.png"),
                ),
              ),
            ),
            FadeIn(
              delay: const Duration(seconds: 3),
              onFinish: (direction) {
                Navigator.pushReplacementNamed(context, IntroScreen.routeName);
              },
              child: Image.asset(
                "assets/logo2.png",
                width: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
