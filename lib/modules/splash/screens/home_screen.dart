import 'package:flutter/material.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/modules/splash/hadith_screen.dart';
import 'package:islami/modules/splash/screens/quran_screen.dart';
import 'package:islami/modules/splash/screens/radio_screen.dart';
import 'package:islami/modules/splash/screens/sebha_screen.dart';
import 'package:islami/modules/splash/screens/time_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;
  List<Widget> screens = [
    QuranScreen(),
    HadithScreen(),
    SebhaScreen(),
    RadioScreen(),
    TimeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedindex,
        onTap: (value) {
          setState(() {
            selectedindex = value;
          });
        },
        selectedItemColor: Colors.white,
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.textcolor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: AppColors.scaffoldBackgroundColor,
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.scaffoldBackgroundColor.withOpacity(0.4),
              ),
              child: Image.asset(
                "assets/quran.png",
                color: Colors.white,
              ),
            ),
            icon: Image.asset("assets/quran.png"),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.scaffoldBackgroundColor.withOpacity(0.4),
              ),
              child: Image.asset(
                "assets/hadith.png",
                color: Colors.white,
              ),
            ),
            icon: Image.asset("assets/hadith.png"),
            label: 'Hadith',
          ),
          BottomNavigationBarItem(
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.scaffoldBackgroundColor.withOpacity(0.4),
              ),
              child: Image.asset(
                "assets/sebha.png",
                color: Colors.white,
              ),
            ),
            icon: Image.asset("assets/sebha.png"),
            label: 'Sebha',
          ),
          BottomNavigationBarItem(
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.scaffoldBackgroundColor.withOpacity(0.4),
              ),
              child: Image.asset(
                "assets/radio.png",
                color: Colors.white,
              ),
            ),
            icon: Image.asset("assets/radio.png"),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.scaffoldBackgroundColor.withOpacity(0.4),
              ),
              child: Image.asset(
                "assets/time.png",
                color: Colors.white,
              ),
            ),
            icon: Image.asset("assets/time.png"),
            label: 'Time',
          ),
        ],
      ),
    );
  }
}
