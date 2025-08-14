import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/core/models/sura_data.dart';

class SuraDeatilsScreen extends StatefulWidget {
  static const String routeName = "SuraDeatils";
  const SuraDeatilsScreen({super.key});

  @override
  State<SuraDeatilsScreen> createState() => _SuraDeatilsScreenState();
}

class _SuraDeatilsScreenState extends State<SuraDeatilsScreen> {
  List<String> verses = [];
  bool isCard = true;
  @override
  Widget build(BuildContext context) {
    SuraData data = ModalRoute.of(context)!.settings.arguments as SuraData;
    if (verses.isEmpty) {
      readFile(data.id);
    }
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        surfaceTintColor: Colors.transparent,
        iconTheme: IconThemeData(color: AppColors.textcolor),
        title: Center(
            child: Text(data.SuraEn,
                style: TextStyle(color: AppColors.textcolor))),
        backgroundColor: AppColors.scaffoldBackgroundColor,
        actions: [
          IconButton(
              onPressed: () {
                isCard = !isCard;
                setState(() {});
              },
              icon: Icon(
                Icons.change_circle_outlined,
                color: AppColors.textcolor,
              ))
        ],
      ),
      body: Column(
        children: [
          Row(children: [
            Image.asset(
              "assets/left.png",
              width: 95,
            ),
            Expanded(
              child: Center(
                child: Text(data.SuraAr,
                    style: TextStyle(
                        color: AppColors.textcolor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Image.asset(
              "assets/right.png",
              width: 95,
            ),
          ]),
          isCard
              ? Expanded(
                  child: ListView.builder(
                    itemCount: verses.length,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: const EdgeInsets.all(4),
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppColors.textcolor),
                          ),
                          child: Center(
                            child: Text(
                              " ${verses[index].trim()} (${index + 1})",
                              style: TextStyle(
                                  fontFamily:
                                      GoogleFonts.amiriQuran().fontFamily,
                                  color: AppColors.textcolor,
                                  fontSize: 25),
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                            ),
                          ));
                    },
                  ),
                )
              : Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Text.rich(
                        TextSpan(
                          children: verses.map(
                            (e) {
                              int index = verses.indexOf(e);
                              return TextSpan(text: e.trim(), children: [
                                TextSpan(
                                    text: " (${index + 1}) ",
                                    style: TextStyle(
                                      color: AppColors.textcolor,
                                      fontSize: 20,
                                      fontFamily:
                                          GoogleFonts.amiriQuran().fontFamily,
                                    )),
                              ]);
                            },
                          ).toList(),
                        ),
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            color: AppColors.textcolor,
                            fontSize: 30,
                            fontFamily: GoogleFonts.amiriQuran().fontFamily),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Future<void> readFile(int id) async {
    String sura =
        (await rootBundle.loadString("assets/suras/${id + 1}.txt")).trim();
    verses = sura.split("\n");
    if (!mounted) return;
    setState(() {});
  }
}
