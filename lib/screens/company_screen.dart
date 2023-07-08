import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompanyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB3F2FD),
        elevation: 2,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black87,
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
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image(image: AssetImage("images/logo.png")),
                  radius: 50,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "CURACELL",
                  style: GoogleFonts.lato(
                    letterSpacing: 4,
                    fontWeight: FontWeight.w500,
                    fontSize: 45,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Version 2.0.0",
                  style: GoogleFonts.josefinSans(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                      fontSize: 19,
                      color: Colors.blueAccent
//                  fontFamily: 'Sanspro',
                      //fontWeight: FontWeight.bold
                      ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Hybrid Battery Solution",
                  style: GoogleFonts.josefinSans(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                    fontSize: 18,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 150,
                  child: Divider(
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: 60,
                  ),
                  //padding: EdgeInsets.symmetric(horizontal: 40),
                  //color: Colors.white,
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.lightBlue,
                    ),
                    title: Text(
                      'Company Number',
                      style: TextStyle(
                        color: Colors.black87,
//                      fontFamily: 'Sanspro',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: 60,
                  ),
                  //padding: EdgeInsets.symmetric(horizontal: 10),
                  //color: Colors.white,
                  child: ListTile(
                    leading: Icon(
                      Icons.mail_outline,
                      color: Colors.lightBlue,
                    ),
                    title: Text(
                      'Company Mail',
                      style: TextStyle(
                        color: Colors.black87,
//                      fontFamily: 'Sanspro',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: 60,
                  ),
                  //padding: EdgeInsets.symmetric(horizontal: 60),
                  //color: Colors.white,
                  child: ListTile(
                    leading: Icon(
                      Icons.place,
                      color: Colors.lightBlue,
                    ),
                    title: Text(
                      'Company Address',
                      style: TextStyle(
                        color: Colors.black87,
//                      fontFamily: 'Sanspro',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
