

// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:main_cluesnew/insert.dart/FormclursStepper.dart';

class welcome extends StatefulWidget {
  const welcome({super.key});

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/well.png'),
            fit: BoxFit.cover,
          )),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(30),
        height: 230,
        decoration: const BoxDecoration(
          color: Color(0xFF244684),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(46), topRight: Radius.circular(46)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            text1(),
            text2(),
            const SizedBox(
              height: 20,
            ),
            welcomebutton(context),
          ],
        ),
      ),
    );
    //   ),
    // );
  }

  Text text2() {
    return const Text(
      'สู่แอปพลิคชันรับแจ้งเบาะแสทางการข่าว',
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Text text1() {
    return const Text(
      "ยินดีต้อนรับ",
      style: TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 35.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

SizedBox welcomebutton(BuildContext context) {
  return SizedBox(
    height: 50,
    child: ElevatedButton(
      child: const Text(
        "กดเเจ้งเบาะเเสที่นี้",
        style: TextStyle(
          fontSize: 20.0,
          color: Color.fromARGB(255, 26, 62, 145),
          fontWeight: FontWeight.bold
        ),
      ),
      onPressed: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const Formclues();
        }));
      },
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    ),
  );
}
