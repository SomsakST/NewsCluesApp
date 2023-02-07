import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:main_cluesnew/screen/contact.dart';
import 'package:main_cluesnew/screen/onboarding1.dart';
import 'package:main_cluesnew/screen/barcommunicate.dart';
import 'package:main_cluesnew/screen/welcom.dart';

class Nevbar extends StatefulWidget {
  @override
  _NevbarState createState() => _NevbarState();
}

class _NevbarState extends State<Nevbar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    // หน้าเซื่อมต่อ
    welcome(),
    barcommunicate(),
    ContactDsi()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 20,
      //   title: const Text('GoogleNavBar'),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: const Color(0xFF244684),
              hoverColor: const Color(0xFF244684),
              gap: 8,
              activeColor: const Color(0xFF244684),
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: const Color.fromARGB(255, 242, 242, 242),
              color: const Color(0xFF244684),
              // ignore: prefer_const_literals_to_create_immutables
              tabs: [
                const GButton(
                  icon: Icons.description_rounded,
                  text: 'เเจ้งเบาะเเส',
                ),
                const GButton(
                  icon: Icons.wallet_membership_rounded,
                  text: 'สื่อความรู้(DSI)',
                ),
                const GButton(
                  icon: Icons.location_history_rounded,
                  text: 'ติดต่อ',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
