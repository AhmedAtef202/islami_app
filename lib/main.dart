import 'package:flutter/material.dart';
import 'package:islami/core/models/hadeth_details/screens/hadeth_details_screen.dart';
import 'package:islami/modules/splash/screens/splash_screen.dart';
import 'package:islami/modules/sura_deatils/screens/sura_deatils_screen.dart';

import 'modules/splash/screens/intro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        IntroScreen.routeName: (context) => const IntroScreen(),
        SuraDeatilsScreen.routeName: (context) => const SuraDeatilsScreen(),
        HadethDetailsScreen.routeName: (context) => const HadethDetailsScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
