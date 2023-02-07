import 'package:flutter/material.dart';
import 'package:main_cluesnew/BottomBar/HomeBar.dart';
import 'package:main_cluesnew/model/constants.dart';
import 'package:main_cluesnew/screen/welcom.dart';

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              createPage(
                image: 'images/d.1.png',
                title: Constants.titleOne,
                description: Constants.descriptionOne,
              ),
              createPage(
                image: 'images/d.2.png',
                title: Constants.titleOne,
                description: Constants.descriptionTwo,
              ),
              createPage(
                image: 'images/d.3.png',
                title: Constants.titleOne,
                description: Constants.descriptionThree,
              ),
              createPage(
                image: 'images/d.4.png',
                title: Constants.descriptionOne,
                description: Constants.descriptionThree,
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Row(
              children: _buildIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10.0,
      width: isActive ? 20 : 8,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        color: Color(0xFF244684),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

//Create the indicator list
  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 4; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}

// ignore: camel_case_types
class createPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const createPage({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            // height: 670,
            // width: 380,
            height: 650,
            width: 500,
            child: Image.asset(image),
          ),
          const SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }
}
