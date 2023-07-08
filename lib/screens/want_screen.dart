import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

class WantScreen extends StatelessWidget {
  const WantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaY: 0, sigmaX: 0),
            child: Opacity(
              opacity: 0.7,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/wantBg.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: GoogleFonts.josefinSans(
                                color: Colors.black87,
                                fontSize: 40,
                                wordSpacing: 8),
                            children: [
                              TextSpan(
                                  text: "Curacell ",
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(text: "needs"),
                            ]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.bluetooth,
                          color: Colors.black45,
                          size: 35,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Bluetooth",
                          style: GoogleFonts.josefinSans(
                              color: Colors.black87,
                              fontSize: 35,
                              wordSpacing: 8),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70),
                    child: RichText(
                      text: TextSpan(
                          style: GoogleFonts.josefinSans(
                              color: Colors.black45,
                              fontSize: 26,
                              wordSpacing: 4),
                          children: [
                            TextSpan(
                                text: " - Switch On",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87)),
                            TextSpan(
                              text: " to proceed",
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.black45,
                          size: 35,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Location Access",
                          style: GoogleFonts.josefinSans(
                              color: Colors.black87,
                              fontSize: 35,
                              wordSpacing: 8),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70),
                    child: RichText(
                      text: TextSpan(
                          style: GoogleFonts.josefinSans(
                              color: Colors.black45,
                              fontSize: 26,
                              wordSpacing: 4),
                          children: [
                            TextSpan(
                                text: " - Allow access",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87)),
                            TextSpan(
                              text: " to search the Device nearby",
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
