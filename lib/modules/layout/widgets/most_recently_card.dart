import 'package:flutter/material.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/core/models/sura_data.dart';
import 'package:islami/modules/sura_deatils/screens/sura_deatils_screen.dart';

class MostRecentlyCard extends StatelessWidget {
  final SuraData suraData;
  const MostRecentlyCard({super.key, required this.suraData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDeatilsScreen.routeName,
            arguments: suraData);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.textcolor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  suraData.SuraEn,
                  style: TextStyle(
                      color: AppColors.scaffoldBackgroundColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Text(
                  suraData.SuraAr,
                  style: TextStyle(
                      color: AppColors.scaffoldBackgroundColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Text(
                  " ${suraData.AyahNumber}  Verses",
                  style: TextStyle(
                      color: AppColors.scaffoldBackgroundColor, fontSize: 14),
                ),
              ],
            ),
            SizedBox(
              width: 12,
            ),
            Image.asset("assets/card_image.png")
          ],
        ),
      ),
    );
  }
}
