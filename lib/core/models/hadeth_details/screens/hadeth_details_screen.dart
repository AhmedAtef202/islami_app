import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/modules/splash/hadith_screen.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = "HadethDetails";
  const HadethDetailsScreen({super.key});

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    HadethData data = ModalRoute.of(context)!.settings.arguments as HadethData;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        surfaceTintColor: Colors.transparent,
        iconTheme: IconThemeData(color: AppColors.textcolor),
        title: Center(
            child:
                Text(data.title, style: TextStyle(color: AppColors.textcolor))),
        backgroundColor: AppColors.scaffoldBackgroundColor,
      ),
      body: Column(children: [
        Row(children: [
          Image.asset(
            "assets/left.png",
            width: 95,
          ),
          Spacer(),
          Image.asset(
            "assets/right.png",
            width: 95,
          ),
        ]),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Text(
                data.body,
                style: TextStyle(
                  color: AppColors.textcolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
