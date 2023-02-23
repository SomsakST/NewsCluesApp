// ignore_for_file: file_names, camel_case_types

import 'dart:async' show Timer;

import 'package:flutter/material.dart';
import 'package:main_cluesnew/BottomBar/BARHOME.dart';
import 'package:main_cluesnew/common/my_colors.dart';



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
            MaterialPageRoute(builder: (BuildContext context) => HomeBar())));
// OnboardingScreen()
    return Scaffold(
      backgroundColor: MyColors.nBlue,
        body: SafeArea(
      child: Center(
        child: Container(
          // decoration: const BoxDecoration(
          //     image: DecorationImage(
          //   image: AssetImage('images/Newclues.6.png'),
          //   fit: BoxFit.cover,
          // )),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/Newclues.5.1.png', scale:8),
              ],
            ),
          ),
        ),
      ),
    ));

   
  }
}
