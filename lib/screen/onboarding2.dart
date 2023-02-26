import 'package:flutter/material.dart';

import 'package:main_cluesnew/model/constants.dart';


class OnboardingScreen2 extends StatefulWidget {
  const OnboardingScreen2({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen2> createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2> {
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
                image: 'images/d.6.png',
                title: Constants.titleOne,
                description: Constants.descriptionOne,
              ),
              createPage(
                image: 'images/d.5.png',
                title: Constants.titleOne,
                description: Constants.descriptionTwo,
              ),
              createPage(
                image: 'images/d.11.png',
                title: Constants.titleOne,
                description: Constants.descriptionThree,
              ),
              createPage(
                image: 'images/d.10.png',
                title: Constants.titleOne,
                description: Constants.descriptionThree,
              ),
              createPage(
                image: 'images/d.7.png',
                title: Constants.titleOne,
                description: Constants.descriptionThree,
              ),
              createPage(
                image: 'images/d.8.png',
                title: Constants.titleOne,
                description: Constants.descriptionThree,
              ),
              createPage(
                image: 'images/d.9.png',
                title: Constants.titleOne,
                description: Constants.descriptionThree,
              ),
              createPage(
                image: 'images/d.12.png',
                title: Constants.titleOne,
                description: Constants.descriptionThree,
              ),
            ],
          ),
          Positioned(
            bottom: 30,
            left: 20,
            child: Row(
              children: _buildIndicator(),
            ),
          ),
           Positioned(
            bottom:15,
            right: 20,
            child: Container(
              // ignore: sort_child_properties_last
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (currentIndex < 8) {
                        currentIndex++;
                        if (currentIndex < 8) {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        }
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 24,
                    color: Colors.white,
                  )),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,  color: Color(0xFF244684),),
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
        color: const Color(0xFF244684),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

//Create the indicator list
  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 8; i++) {
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
             height: 700,
            width: 500,
            child: Image.asset(image),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
