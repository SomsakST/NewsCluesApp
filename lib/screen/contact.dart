// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:main_cluesnew/common/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDsi extends StatefulWidget {
  const ContactDsi({super.key});

  @override
  State<ContactDsi> createState() => _ContactDsiState();
}

class _ContactDsiState extends State<ContactDsi> {
  final String telephoneNumber = "028319888";
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
            //     fit: BoxFit.cover,
            //   ),
            // ),
            child: Column(
              children: <Widget>[
                SizedBox(
                height: 53,
              ),
              Image.asset(
                "images/1.1.png",
                scale: 6,
              ), SizedBox(
                height: 53,
              ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0,
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: MyColors.nBlue,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(32),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //  const SizedBox(
                        //   height: 5,
                        // ),
                        Center(
                          child: Image.asset(
                            "images/Newclues.5.1.png",
                            scale: 4.5,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'ที่อยู่',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'ส่วนวิเคราะห์ข้อมูลอาชญากรรมและการข่าว ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 17,
                            height: 1.5,
                          ),
                        ),
                        const Text(
                          'กองเทคโนโลยีและศูนย์ข้อมูลการตรวจสอบ ( ชั้น 7 )\nอาคารกรมสอบสวนคดีพิเศษ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                           
                            height: 1.5,
                          ),
                        ),
                        const Text(
                          'เลขที่ 128 ถนนแจ้งวัฒนะ แขวงทุ่งสองห้อง เขตหลักสี่ กรุงเทพฯ 10210',
                          style: TextStyle(
                            height: 1.6,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'เบอร์โทรศัพท์',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        ListTile(
                          title: const Text(
                            "0-2831-9888 ต่อ 50961",
                            style: TextStyle(
                              fontSize: 19,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          onTap: () async {
                            String telephoneUrl = "tel:$telephoneNumber";
                            if (await canLaunch(telephoneUrl)) {
                              await launch(telephoneUrl);
                            } else {
                              throw "Can't phone that number.";
                            }
                          },
                        ),
                        
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}