import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:main_cluesnew/common/my_colors.dart';
import 'package:main_cluesnew/common/my_font_size.dart';
import 'package:main_cluesnew/insert.dart/FormclursStepper.dart';
import 'package:main_cluesnew/screen/onboarding1.dart';
import 'package:main_cluesnew/screen/onboarding2.dart';

class Welclues extends StatefulWidget {
  const Welclues({super.key});

  @override
  State<Welclues> createState() => _WelcluesState();
}

class _WelcluesState extends State<Welclues> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
       child : Scaffold(
        backgroundColor: MyColors.nWhite,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          // decoration: const BoxDecoration(
          //     image: DecorationImage(
          //   image: AssetImage('images/Newclues.7.png'),
          //   fit: BoxFit.cover,
          // )),
          child: Column(
            children: [
             const SizedBox(
                height: 60,
              ),
              Image.asset(
                "images/1.2.png",
                scale: 4,
              ), const SizedBox(
                height: 40,
              ),
              Card(
                color: MyColors.nWhite,
                margin: const EdgeInsets.all(10),
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 30, left: 20, right: 20, bottom: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(height: 50,),
                          Container(
                            width: 40,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(1000),
                              child: Image.asset(
                                'images/DSI.LG.png',
                                height: 40,
                                width: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              Text(
                                "เเอปพลิเคชันรับเเจ้งเบาะเเสทางการข่าว",
                                style: TextStyle(
                                    color: MyColors.blackText,
                                    fontSize: MyFontSize.small2),
                              ),
                              // const SizedBox(height: 3),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Icon(
                                  //   Icons.circle_outlined,
                                  //   size: 10,
                                  //   color: MyColors.blackText,
                                  // ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Bohsea Khaw Application",
                                    style: TextStyle(
                                        color: MyColors.blackText,
                                        fontSize: MyFontSize.medium1),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  // Icon(
                                  //   Icons.circle_outlined,
                                  //   size: 10,
                                  //   color: MyColors.blackText,
                                  // ),
                                ],
                              ),
                            ],
                          )),
                          Container(
                            width: 40,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(1000),
                              child: Image.asset(
                                'images/LG.png',
                                height: 40,
                                width: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height:10,
                      ),
                      const Text(
                        "เบาะเเสทางการข่าว",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: MyColors.nBlue,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "ส่วนวิเคราะห์ข้อมูลอาชญากรรมและการข่าว",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: MyColors.blackText,
                          fontSize: MyFontSize.medium2,
                        ),
                      ),
                      const SizedBox(height: 30),
                     welcomebutton(context),
                    ],
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    ));
  }

  SizedBox welcomebutton(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        child: const Text(
          "กดเเจ้งเบาะเเสที่นี้",
          style: TextStyle(
              fontSize: 20.0,
              color: MyColors.nWhite,
              fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const Formclues();
          }));
        },
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.white,
          backgroundColor: MyColors.nBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
      ),
    );
  }
}
