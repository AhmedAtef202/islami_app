import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/modules/splash/screens/home_screen.dart';

class IntroScreen extends StatefulWidget {
  static const String routeName = "IntroductionScreen";
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();
  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0, color: AppColors.textcolor);
    const pageDecoration = PageDecoration(
        titleTextStyle: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: AppColors.textcolor),
        bodyTextStyle: bodyStyle,
        pageColor: Color(0xff202020),
        imagePadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.all(35));
    return IntroductionScreen(
      showDoneButton: true,
      showNextButton: true,
      showSkipButton: true,
      showBackButton: true,
      next: const Text(
        "Next",
        style: TextStyle(fontSize: 16, color: AppColors.textcolor),
      ),
      back: const Text(
        "Back",
        style: TextStyle(fontSize: 16, color: AppColors.textcolor),
      ),
      skip: const Text(
        "Skip",
        style: TextStyle(fontSize: 16, color: AppColors.textcolor),
      ),
      done: const Text(
        "Finish",
        style: TextStyle(fontSize: 16, color: AppColors.textcolor),
      ),
      skipOrBackFlex: 0,
      nextFlex: 0,
      curve: Curves.easeIn,
      dotsDecorator: DotsDecorator(
        color: AppColors.textcolor,
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      key: introKey,
      globalBackgroundColor: AppColors.scaffoldBackgroundColor,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      infiniteAutoScroll: true,
      globalHeader: Align(
        alignment: Alignment.center,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16,
            ),
            child: _buildImage('intro app bar.png', 200),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Welcome To Islami App",
          body: "",
          image: _buildImage("intro1.png"),
          decoration: pageDecoration.copyWith(
            bodyFlex: 5,
            imageFlex: 15,
            safeArea: 80,
          ),
        ),
        PageViewModel(
          title: "Welcome To Islami App",
          body: "We Are Very Excited To Have You In Our Community",
          image: _buildImage("intro2.png"),
          decoration: pageDecoration.copyWith(
            bodyFlex: 5,
            imageFlex: 15,
            safeArea: 80,
          ),
        ),
        PageViewModel(
          title: "Welcome To Islami App",
          body: "Read, and your Lord is the Most Generous",
          image: _buildImage("intro3.png"),
          decoration: pageDecoration.copyWith(
            bodyFlex: 5,
            imageFlex: 15,
            safeArea: 80,
          ),
        ),
        PageViewModel(
          title: "Welcome To Islami App",
          body: "Praise the name of your Lord, the Most High",
          image: _buildImage("intro4.png"),
          decoration: pageDecoration.copyWith(
            bodyFlex: 5,
            imageFlex: 15,
            safeArea: 80,
          ),
        ),
        PageViewModel(
          title: "Welcome To Islami App",
          body:
              "You can listen to the Holy Quran Radio through the application for free and easily",
          image: _buildImage("intro5.png"),
          decoration: pageDecoration.copyWith(
            bodyFlex: 5,
            imageFlex: 15,
            safeArea: 80,
          ),
        ),
      ],
    );
  }
}
