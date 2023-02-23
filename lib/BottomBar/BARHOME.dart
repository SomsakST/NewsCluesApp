// ignore_for_file: sort_child_properties_last

import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:main_cluesnew/common/my_colors.dart';
import 'package:main_cluesnew/insert.dart/FormclursStepper.dart';
import 'package:main_cluesnew/screen/DATAcommunicate.dart';
import 'package:main_cluesnew/screen/Welclues.dart';
import 'package:main_cluesnew/screen/contact.dart';


class HomeBar extends StatefulWidget {
  HomeBar({
    Key? key,
    this.title,
  }) : super(key: key);
  final String? title;

  @override
  _HomeBarState createState() => _HomeBarState();
}

class _HomeBarState extends State<HomeBar> {
  Widget? _child;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);

    _child = const Formclues();
    super.initState();
  }

  int selectedPos = 1;

  double bottomNavBarHeight = 55;

  List<TabItem> tabItems = List.of([
    TabItem(
      Icons.home,
      "ข้อมูลเพิ่มเติม",
      MyColors.nBlue,
    ),
    TabItem(
      Icons.search,
      "เเจ้งเบาะเเส",
      MyColors.nOrange,
    ),
    TabItem(
      Icons.notifications,
      "ติดต่อ",
      MyColors.nBlue,
    ),
  ]);

  late CircularBottomNavigationController _navigationController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Padding(
              child: bodyContainer(),
              padding: EdgeInsets.only(bottom: bottomNavBarHeight),
            ),
            Align(alignment: Alignment.bottomCenter, child: bottomNav())
          ],
        ),
      ),
    );
  }

  Widget bodyContainer() {
    Color? selectedColor = tabItems[selectedPos].circleColor;
    String slogan;
    switch (selectedPos) {
      case 0:
        _child = DATAcommunicate();
        break;
      case 1:
        _child = const Welclues();
        break;
      case 2:
        _child = const ContactDsi();
        break;
      default:
        slogan = "";
        break;
    }

    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: selectedColor,
        child: Center(child: _child),
      ),
      onTap: () {
        if (_navigationController.value == tabItems.length - 1) {
          _navigationController.value = 0;
        } else {
          _navigationController.value = _navigationController.value! + 1;
        }
      },
    );
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      selectedPos: selectedPos,
      barHeight: bottomNavBarHeight,
      // use either barBackgroundColor or barBackgroundGradient to have a gradient on bar background
      barBackgroundColor: Colors.white,
      // barBackgroundGradient: LinearGradient(
      //   begin: Alignment.bottomCenter,
      //   end: Alignment.topCenter,
      //   colors: [
      //     Colors.blue,
      //     Colors.red,
      //   ],
      // ),
      backgroundBoxShadow: const <BoxShadow>[
        BoxShadow(color: Colors.black45, blurRadius: 10.0),
      ],
      animationDuration: const Duration(milliseconds: 300),
      selectedCallback: (int? selectedPos) {
        setState(() {
          this.selectedPos = selectedPos ?? 0;
          print(_navigationController.value);
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}
