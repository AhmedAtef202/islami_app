import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/core/models/hadeth_details/screens/hadeth_details_screen.dart';

class HadithScreen extends StatefulWidget {
  const HadithScreen({super.key});

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  List<HadethData> hadethData = [];
  @override
  Widget build(BuildContext context) {
    if (hadethData.isEmpty) {
      readAhadeth();
    }
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Image.asset(
                  "assets/intro app bar.png",
                  width: 250,
                ),
              ),
            ),
            Expanded(
              child: CarouselSlider(
                options: CarouselOptions(
                    scrollDirection: Axis.vertical,
                    enlargeCenterPage: true,
                    height: 500.0),
                items: hadethData.map((hadeth) {
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, HadethDetailsScreen.routeName,
                              arguments: hadeth);
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration:
                                BoxDecoration(color: AppColors.textcolor),
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(children: [
                                        Image.asset(
                                          "assets/left.png",
                                          color:
                                              AppColors.scaffoldBackgroundColor,
                                          width: 95,
                                        ),
                                        Spacer(),
                                        Image.asset(
                                          "assets/right.png",
                                          color:
                                              AppColors.scaffoldBackgroundColor,
                                          width: 95,
                                        ),
                                      ]),
                                    ),
                                    Expanded(
                                        child: Opacity(
                                      opacity: 0.3,
                                      child: Image.asset(
                                          "assets/HadithCardBackGround.png"),
                                    )),
                                    ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(20)),
                                        child: Image.asset(
                                            "assets/Mosque-02.png")),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
                                      Text(
                                        hadeth.title,
                                        style: TextStyle(
                                            color: AppColors
                                                .scaffoldBackgroundColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24),
                                      ),
                                      SizedBox(height: 40),
                                      Expanded(
                                        child: Text(
                                          hadeth.body,
                                          style: TextStyle(
                                              color: AppColors
                                                  .scaffoldBackgroundColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                          textDirection: TextDirection.rtl,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                      );
                    },
                  );
                }).toList(),
              ),
            )
          ]),
        ),
      ),
    );
  }

  Future<void> readAhadeth() async {
    for (int i = 1; i <= 50; i++) {
      String hadeth = await rootBundle.loadString("assets/Hadeeth/h$i.txt");
      String title = hadeth.trim().split("\n")[0];
      String body = hadeth.trim().split("\n")[1];

      HadethData data = HadethData(title: title, body: body);
      hadethData.add(data);
    }
    setState(() {});
  }
}

class HadethData {
  String title;
  String body;

  HadethData({required this.title, required this.body});
}
