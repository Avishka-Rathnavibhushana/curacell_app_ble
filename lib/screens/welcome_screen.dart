import 'dart:ui';
import 'package:curacell/modules/rounded_button.dart';
import 'package:curacell/screens/register_screen.dart';
import 'package:curacell/services/bluetooth_service.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "welcome_screen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    // BluetoothService bluetoothService = BluetoothService();
    // bluetoothService.enableBluetooth();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 14.0),
              child: Icon(FontAwesomeIcons.copyright),
            ),
            Text(
              "Curacell Innovations (pvt) Ltd.",
              style: GoogleFonts.josefinSans(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaY: 0, sigmaX: 0),
            child: Opacity(
              opacity: 0.5,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/welcomeBg.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Hero(
                      tag: "logo",
                      child: Container(
                        child: Image.asset('images/logo.png'),
                        height: 130,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Text('CURACELL',
                          style: GoogleFonts.lato(
                              color: Color(0xFF13488E),
                              fontSize: 55,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 48.0,
                ),
                RoundedButton(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                }, Colors.lightBlueAccent, "Log In"),
                RoundedButton(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RegistrationScreen();
                      },
                    ),
                  );
                }, Colors.blueAccent, 'Register')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
