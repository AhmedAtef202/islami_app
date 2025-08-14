import 'package:flutter/material.dart';
import 'package:islami/core/models/sura_data.dart';
import 'package:islami/modules/sura_deatils/screens/sura_deatils_screen.dart';

class SuraWidget extends StatelessWidget {
  final SuraData suraData;
  final Function() onTap;
  const SuraWidget({required this.suraData, super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
        Navigator.pushNamed(context, SuraDeatilsScreen.routeName,
            arguments: suraData);
      },
      child: Row(children: [
        Stack(alignment: Alignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/sura_number.png",
              width: 55,
            ),
          ),
          Text(
            (suraData.id + 1).toString(),
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          )
        ]),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              suraData.SuraEn,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              suraData.AyahNumber + " Verses",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ]),
        ),
        Text(
          suraData.SuraAr,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }
}
