import 'package:awesome_bottom_navigation/awesome_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:sample/account_screen.dart';
import 'package:sample/advance_screen.dart';
import 'package:sample/connections_screen.dart';
import 'package:sample/contact_us_screen.dart';
import 'package:sample/status_screen.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final List<Widget> pages = [
    ContactUsScreen(),
    AdvanceScreen(),
    ConnectionsScreen(),
    StatusScreen(),
    AccountScreen(),
  ];

  int selected = 2;

  @override
  void initState() {
    super.initState();
    setState(() {
      selected = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          "assets/background.png",
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: AwesomeBottomNav(
            icons: [
              Column(
                children: [
                  ImageIcon(
                    AssetImage("assets/customer-service.png"),
                    size: 30,
                    color: Color(0xFF40CFA4),
                  ),
                  Text(
                    "CONTACT US",
                    style: TextStyle(
                      color: Color(0xFF40CFA4),
                      fontSize: 7,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  ImageIcon(
                    AssetImage("assets/status.png"),
                    size: 30,
                    color: Color(0xFF40CFA4),
                  ),
                  Text(
                    "ADVANCE",
                    style: TextStyle(
                      color: Color(0xFF40CFA4),
                      fontSize: 7,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  ImageIcon(
                    AssetImage("assets/network.png"),
                    size: 30,
                    color: Color(0xFF40CFA4),
                  ),
                  Text(
                    "CONNECTIONS",
                    style: TextStyle(
                      color: Color(0xFF40CFA4),
                      fontSize: 7,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  ImageIcon(
                    AssetImage("assets/data-analysis.png"),
                    size: 30,
                    color: Color(0xFF40CFA4),
                  ),
                  Text(
                    "STATUS",
                    style: TextStyle(
                      color: Color(0xFF40CFA4),
                      fontSize: 7,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  ImageIcon(
                    AssetImage("assets/account.png"),
                    size: 30,
                    color: Color(0xFF40CFA4),
                  ),
                  Text(
                    "ACCOUNT",
                    style: TextStyle(
                      color: Color(0xFF40CFA4),
                      fontSize: 7,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
            highlightedIcons: [
              ImageIcon(
                AssetImage("assets/customer-service.png"),
                color: Color(0xFF40CFA4),
              ),
              ImageIcon(
                AssetImage("assets/status.png"),
                color: Color(0xFF40CFA4),
              ),
              ImageIcon(
                AssetImage("assets/network.png"),
                color: Color(0xFF40CFA4),
              ),
              ImageIcon(
                AssetImage("assets/data-analysis.png"),
                color: Color(0xFF40CFA4),
              ),
              ImageIcon(
                AssetImage("assets/account.png"),
                color: Color(0xFF40CFA4),
              ),
            ],
            onTapped: (int value) {
              setState(() {
                selected = value;
              });
            },
            bodyBgColor: Colors.transparent,
            highlightColor: Colors.white,
            navFgColor: Colors.grey.withOpacity(0.5),
            navBgColor: Colors.white,
          ),
          body: pages[selected],
        ),
      ],
    );
  }
}
