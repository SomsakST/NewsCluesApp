// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:main_cluesnew/screen/onboarding1.dart';
import 'package:main_cluesnew/screen/onboarding2.dart';

class barcommunicate1 extends StatefulWidget {
  const barcommunicate1({Key? key}) : super(key: key);

  @override
  _barcommunicate1State createState() => _barcommunicate1State();
}

class _barcommunicate1State extends State<barcommunicate1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Scaffold(
              body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 230, 230, 230),
                      borderRadius: BorderRadius.circular(25.0)),
                  child: TabBar(
                    indicator: BoxDecoration(
                        color: const Color(0xFF244684),
                        borderRadius: BorderRadius.circular(25.0)),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: const [
                      Tab(
                        text: 'เตือนภัย',
                      ),
                      
                    ],
                  ),
                ),
                const Expanded(
                    child: TabBarView(
                  children: [
                    OnboardingScreen2(),
                    
                  ],
                ))
              ],
            ),
          )),
        ),
      ),
    );
  }
}
