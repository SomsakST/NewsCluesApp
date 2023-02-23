import 'package:flutter/material.dart';
import 'package:main_cluesnew/common/my_colors.dart';
import 'package:main_cluesnew/common/my_font_size.dart';
import 'package:main_cluesnew/common/my_style.dart';
import 'package:main_cluesnew/insert.dart/FormclursStepper.dart';
import 'package:main_cluesnew/screen/onboarding2.dart';
import 'package:main_cluesnew/ui/screens/tracking/tracking_shipment.dart';
import 'package:main_cluesnew/ui/widgets/custom_card.dart';


class WidgetBanner extends StatefulWidget {
  const WidgetBanner({Key? key}) : super(key: key);

  @override
  _WidgetBannerState createState() => _WidgetBannerState();
}

class _WidgetBannerState extends State<WidgetBanner> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            child: Image.asset("images/0.0.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 20, right: 20,),
            child: Column(
              children: [
                Row(
                  children: [
                    // Container(
                    //   width: 40,
                    //   child: IconButton(
                    //       onPressed: () {},
                    //       icon: Icon(
                    //         Icons.menu,
                    //         color: MyColors.blackText,
                    //       )),
                    // ),
                    Expanded(
                        child: Column(
                      children: [
                        Text(
                          "เเอปพลิเคชันรับเเจ้งเบาะเเสทางการข่าว",
                          style: TextStyle(
                              color: MyColors.blackText, fontSize: MyFontSize.small2),
                        ),
                        const SizedBox(height: 3),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.circle_outlined, size: 10, color: MyColors.blackText,),
                            const SizedBox(width: 10,),
                            Text(
                              "Bohsea Khaw Application",
                              style: TextStyle(
                                  color: MyColors.blackText, fontSize: MyFontSize.medium1),
                            ),
                            const SizedBox(width: 5,),
                            Icon(Icons.arrow_drop_down, size: 24, color: MyColors.blackText,),
                          ],
                        ),
                      ],
                    )),
                    // Container(
                    //   width: 40,
                    //   child: ClipRRect(
                    //     borderRadius: BorderRadius.circular(1000),
                    //     child: Image.asset(
                    //       'images/0.png',
                    //       height: 40,
                    //       width: 40,
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // )
                  ],
                ),
                const SizedBox(height: 20,),
                Text(
                  "เบาะเเสทางการข่าว",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: MyColors.blackText,
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "ส่วนวิเคราะห์ข้อมูลอาชญากรรมและการข่าว",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: MyColors.blackText,
                    fontSize: MyFontSize.medium2,
                  ),
                ),
                const SizedBox(height: 20),
                CustomCard(
                  shadow: false,
                  height: 50,
                  width: double.infinity,
                  bgColor: MyColors.white,
                  shadowColor: MyColors.nBlack,
                  borderRadius: BorderRadius.circular(10),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      const Icon(Icons.system_update_tv_outlined, color: MyColors.nOrange,),
                      const SizedBox(width: 10,),
                      const Expanded(
                        child: Text(
                          "เเจ้งเบาะเสทางการข่าว",
                        )
                      ),
                      const SizedBox(width: 10,),
                      CustomCard(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Formclues()));
                        },
                        shadow: false,
                        bgColor: MyColors.nOrange,
                        borderRadius: BorderRadius.circular(10),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                        child: const Text(
                          "ที่นี้",
                        ),
                        
                      ),
                     
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
