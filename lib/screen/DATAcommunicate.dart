// ignore_for_file: deprecated_member_use, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:main_cluesnew/common/my_colors.dart';
import 'package:main_cluesnew/common/my_font_size.dart';
import 'package:main_cluesnew/screen/barcommunicate1.dart';
import 'package:main_cluesnew/screen/barcommunicate2.dart';

import 'package:main_cluesnew/screen/onboarding1.dart';
import 'package:main_cluesnew/screen/onboarding2.dart';
import 'package:main_cluesnew/ui/widgets/custom_card.dart';
import 'package:url_launcher/url_launcher.dart';

class DATAcommunicate extends StatefulWidget {
  const DATAcommunicate({super.key});

  @override
  State<DATAcommunicate> createState() => _DATAcommunicateState();
}

class _DATAcommunicateState extends State<DATAcommunicate> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.white,
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage('images/Newclues.7.png'),
            //     alignment: Alignment.topCenter,
            //     fit: BoxFit.fitWidth,
            //   ),
            // ),
            child: Column(
              children: <Widget>[
                
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "images/1.4.png",
                  scale: 5,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "ข้อมูลเพิ่มเติม",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: MyColors.nBlue,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                
                Onboaring(context),
             
              ],
            ),
          ),
        ),
      ),
    );
  }

  SingleChildScrollView Onboaring(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: StaggeredGrid.count(
          crossAxisCount: 1,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: [
            CustomCard(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const barcommunicate()));
              },
              shadow: true,
              shadowColor: MyColors.nBlack,
              shadowOpacity: 0.5,
              width: double.infinity,
              bgColor: MyColors.nWhite,
              borderRadius: BorderRadius.circular(15),
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomCard(
                          shadow: false,
                          height: 50,
                          width: 50,
                          bgColor: MyColors.yellow,
                          borderRadius: BorderRadius.circular(100),
                          child: const Center(
                              child: Icon(
                            Icons.dataset,
                            color: Colors.white,
                          ))),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "กรมสอบสวนตดีพิเศษ",
                        style: TextStyle(
                            color: MyColors.blackText,
                            fontSize: MyFontSize.medium1,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "Department of Special Investigation | DSI",
                      style: TextStyle(
                        color: MyColors.blackText.withOpacity(.8),
                        fontSize: MyFontSize.small3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomCard(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const barcommunicate1()));
              },
              shadow: true,
              shadowColor: MyColors.nBlack,
              shadowOpacity: 0.5,
              width: double.infinity,
              bgColor: MyColors.nWhite,
              borderRadius: BorderRadius.circular(15),
              padding: const EdgeInsets.all(18),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomCard(
                      shadow: false,
                      height: 50,
                      width: 50,
                      bgColor: MyColors.yellow,
                      borderRadius: BorderRadius.circular(32),
                      child: const Center(
                          child: Icon(
                        Icons.warning_rounded,
                        color: Colors.white,
                      ))),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    "เตือนภัย",
                    style: TextStyle(
                        color: MyColors.blackText,
                        fontSize: MyFontSize.medium1,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
