import 'package:flutter/material.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/core/constant/app_constant.dart';
import 'package:islami/core/models/sura_data.dart';
import 'package:islami/modules/layout/sura_widget.dart';
import 'package:islami/modules/layout/widgets/most_recently_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  List<int> indexes = [];
  List<String> mostrecently = [];
  @override
  void initState() {
    getMostRecently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/Background home screen.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Image.asset(
                    "assets/intro app bar.png",
                    width: 250,
                  ),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                onChanged: (value) {
                  search(value);
                },
                cursorColor: AppColors.textcolor,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Sura Name",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Image.asset(
                    "assets/quran.png",
                    color: AppColors.textcolor,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: AppColors.textcolor)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: AppColors.textcolor)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: AppColors.textcolor)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Suras List",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              if (indexes.isEmpty && mostrecently.isNotEmpty)
                Text(
                  "MostRecently",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              if (indexes.isEmpty && mostrecently.isNotEmpty)
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    itemCount: mostrecently.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      int currentindex = int.parse(mostrecently[index]);
                      return MostRecentlyCard(
                          suraData: SuraData(
                              id: currentindex,
                              SuraAr: AppConstant.SuraAr[currentindex],
                              SuraEn: AppConstant.SuraEn[currentindex],
                              AyahNumber:
                                  AppConstant.AyahNumber[currentindex]));
                    },
                  ),
                ),
              SizedBox(
                height: 8,
              ),
              Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          endIndent: 25,
                          height: 8,
                          indent: 25,
                        ),
                    itemCount: indexes.isEmpty
                        ? AppConstant.SuraAr.length
                        : indexes.length,
                    itemBuilder: (context, index) {
                      int currentindex =
                          indexes.isEmpty ? index : indexes[index];
                      return SuraWidget(
                          onTap: () {
                            addMostRecently(currentindex);
                          },
                          suraData: SuraData(
                              id: currentindex,
                              SuraAr: AppConstant.SuraAr[currentindex],
                              SuraEn: AppConstant.SuraEn[currentindex],
                              AyahNumber:
                                  AppConstant.AyahNumber[currentindex]));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void search(String value) {
    indexes.clear();
    try {
      int index = int.parse(value);
      indexes.add(index - 1);
    } catch (e) {
      AppConstant.SuraEn.where(
        (element) {
          if (element.toLowerCase().contains(value.toLowerCase())) {
            indexes.add(AppConstant.SuraEn.indexOf(element));
          }
          return true;
        },
      ).toList();
      AppConstant.SuraAr.where(
        (element) {
          if (element.toLowerCase().contains(value.toLowerCase())) {
            indexes.add(AppConstant.SuraAr.indexOf(element));
          }
          return true;
        },
      ).toList();
    }
    if (value.isEmpty) {
      indexes.clear();
    }

    setState(() {});
  }

  void addMostRecently(int id) async {
    if (mostrecently.contains(id.toString())) return;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    mostrecently.insert(0, id.toString());

    await prefs.setStringList("mostrecently", mostrecently);
    setState(() {});
  }

  void getMostRecently() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    mostrecently = prefs.getStringList("mostrecently") ?? [];
    setState(() {});
  }
}
