import 'package:awesome_bottom_navigation/awesome_bottom_navigation.dart';
import 'package:curacell/home_screen.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final _bgColor = Color(0xFFF6F6F6);

  final List<Widget> pages = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: AwesomeBottomNav(
        icons: [
          Icons.category_outlined,
          Icons.home_outlined,
          Icons.send_outlined,
        ],
        highlightedIcons: [
          Icons.category,
          Icons.home,
          Icons.send_rounded,
        ],
        onTapped: (int value) {
          setState(() {
            selected = value;
          });
        },
        bodyBgColor: _bgColor,
        highlightColor: Color(0xFFFF9944),
        navFgColor: Colors.grey.withOpacity(0.5),
        navBgColor: Colors.white,
      ),
      body: SafeArea(
        child: pages[selected],
      ),
    );
  }
}
