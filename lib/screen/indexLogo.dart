// ignore_for_file: file_names, camel_case_types

import 'dart:async' show Timer;

import 'package:flutter/material.dart';
import 'package:main_cluesnew/BottomBar/HomeBar.dart';
import 'package:main_cluesnew/screen/welcom.dart';

class indexLogo extends StatefulWidget {
  const indexLogo({super.key});

  @override
  State<indexLogo> createState() => _indexLogoState();
}

class _indexLogoState extends State<indexLogo> {
  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Nevbar())));
// OnboardingScreen()
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/Newclues.6.png'),
            fit: BoxFit.cover,
          )),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/Newclues.3.png', scale: 1.4),
              ],
            ),
          ),
        ),
      ),
    ));

    // Scaffold(
    //   backgroundColor: const Color(0xFF244684),
    //   body: Center(
    //     child: Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Image.asset('images/Newclues.4.png',  scale: 1.5,),
    //           // const Text(
    //           //   "กองเทคโนโลยีเเละศูนย์ข้อมูลการตรวจสอบ",
    //           //   style: TextStyle(fontSize: 10, color: Colors.white),
    //           // )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
