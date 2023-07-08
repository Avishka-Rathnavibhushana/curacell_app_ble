import 'dart:ui';
import 'package:path/path.dart' as Path;
import 'package:avatar_glow/avatar_glow.dart';
import 'package:block_ui/block_ui.dart';
import 'package:curacell/screens/device_screen.dart';
import 'package:curacell/screens/want_screen.dart';
import 'package:curacell/screens/welcome_screen.dart';
import 'package:curacell/services/bluetooth_service.dart';
import 'package:curacell/services/firebase_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vibration/vibration.dart';

import 'company_screen.dart';

class ConnectScreen extends StatefulWidget {
  const ConnectScreen({Key? key}) : super(key: key);

  @override
  ConnectScreenState createState() => ConnectScreenState();
}

class ConnectScreenState extends State<ConnectScreen> {
  bool enabled = false;
  bool animate = true;

  void welcome() {
    final provider = AuthFunctions();
    provider.getUser();
    showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.info(
          message: (provider.firebaseUser!.displayName == null)
              ? "WELCOME ${provider.firebaseUser!.email!.toUpperCase()}"
              : "WELCOME ${provider.firebaseUser!.displayName!.toUpperCase()}",
        ),
        displayDuration: Duration(seconds: 1));
  }

  void signOut() async {
    final provider = Provider.of<AuthFunctions>(context, listen: false);
    await provider.signOut();
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return WelcomeScreen();
      },
    ));
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      welcome();
    });
  }

  void aboutUs() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return CompanyScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final providerBluetooth =
        Provider.of<BluetoothService>(context, listen: false);
    return StreamBuilder(
        stream: providerBluetooth.streamScreen,
        builder: (c, snapshot) {
          final state = snapshot.data.toString();
          if (state == "BluetoothState.on") {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white12,
                elevation: 0,
                automaticallyImplyLeading: false,
                actions: <Widget>[
                  PopupMenuButton(
                    icon: Icon(
                      Icons.sort,
                      color: Colors.black,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    elevation: 15,
                    itemBuilder: (BuildContext bc) => [
                      PopupMenuItem(
                          child: Text("About Us",
                              style: TextStyle(
                                fontFamily: 'Right',
                                letterSpacing: 1.5,
                              )),
                          value: 'about'),
                      PopupMenuItem(
                          child: Text("Sign Out",
                              style: TextStyle(
                                fontFamily: 'Right',
                                letterSpacing: 1.5,
                              )),
                          value: 'sign'),
                      PopupMenuItem(
                          child: Text("Dashboard",
                              style: TextStyle(
                                fontFamily: 'Right',
                                letterSpacing: 1.5,
                              )),
                          value: 'dashboard'),
                    ],
                    onSelected: (value) {
                      print('the code');
                      print(value);
                      if (value == 'about') {
                        aboutUs();
                      } else if (value == 'sign') {
                        signOut();
                      } else {
                        launch('https://curacellinnovations.com');
                      }
                    },
                  ),
                ],
                title: Text(
                  "Curacell",
                  style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
              body: Stack(
                children: [
                  ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaY: 0, sigmaX: 0),
                    child: Opacity(
                      opacity: 0.4,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/connectBg.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(23)),
                              elevation: 25,
                              child: CircleAvatar(
                                child: Icon(
                                  Icons.bluetooth,
                                  size: 35,
                                  color: Colors.white,
                                ),
                                backgroundColor: Color(0xFF329DF6),
                                radius: 23,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CupertinoSwitch(
                                activeColor: Color(0xFF22ADE8),
                                value: true,
                                onChanged: null,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 95),
                          child: Column(
                            children: [
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    style: GoogleFonts.josefinSans(
                                        color: Colors.black,
                                        fontSize: 35,
                                        wordSpacing: 8),
                                    children: [
                                      TextSpan(
                                          text: "Click to Connect \n with "),
                                      TextSpan(
                                          text: "Curacell",
                                          style: GoogleFonts.lato(
                                            fontWeight: FontWeight.bold,
                                          ))
                                    ]),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Align(
                                alignment: FractionalOffset.bottomCenter,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Visibility(
                                      maintainState: true,
                                      visible: true,
                                      child: AvatarGlow(
                                        glowColor: Colors.blueAccent,
                                        duration: Duration(milliseconds: 1200),
                                        curve: Curves.elasticInOut,
                                        repeat: true,
                                        animate: animate,
                                        showTwoGlows: true,
                                        repeatPauseDuration:
                                            Duration(milliseconds: 2),
                                        endRadius: 150,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black26,
                                                  offset: Offset(0, 4),
                                                  blurRadius: 5.0)
                                            ],
                                          ),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Color(0xFF4C85C6),
                                              elevation: 50,
                                              shape: CircleBorder(),
                                              padding: EdgeInsets.all(24),
                                            ),
                                            onPressed: () {
                                              // showAlertDialog(context);
                                              Vibration.vibrate(
                                                  duration: 150,
                                                  amplitude: 200);

                                              BlockUi.show(
                                                context,
                                                child: Container(
                                                  padding: EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      CircularProgressIndicator(),
                                                      Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 30),
                                                          child: Text(
                                                              "Please wait..",
                                                              style: GoogleFonts
                                                                  .josefinSans(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ))),
                                                    ],
                                                  ),
                                                ),
                                              );
                                              providerBluetooth.startScan();
                                              Future.delayed(
                                                  const Duration(
                                                      milliseconds: 4500), () {
                                                print(
                                                    "connect ${providerBluetooth.isDone}");
                                                if (providerBluetooth.isDone) {
                                                  BlockUi.hide(context);
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return DeviceScreen();
                                                      },
                                                    ),
                                                  );
                                                } else {
                                                  BlockUi.hide(context);
                                                  Alert(
                                                    closeIcon: SizedBox(
                                                      height: 10,
                                                    ),
                                                    style: AlertStyle(
                                                        descStyle:
                                                            GoogleFonts.lato(
                                                                color: Colors
                                                                    .black45,
                                                                fontSize: 23,
                                                                wordSpacing: 5),
                                                        titleStyle: GoogleFonts
                                                            .josefinSans(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 20,
                                                                wordSpacing: 4),
                                                        backgroundColor:
                                                            Colors.white),
                                                    context: context,
                                                    type: AlertType.error,
                                                    title: "UNABLE TO CONNECT",
                                                    desc: "Try Again!",
                                                    buttons: [
                                                      DialogButton(
                                                        child: Text(
                                                          "OK",
                                                          style: TextStyle(
                                                              fontSize: 20),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        color: Colors.redAccent,
                                                        width: 120,
                                                      )
                                                    ],
                                                  ).show();
                                                }
                                              });
                                            },
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.wifi_tethering,
                                                  size: 60,
                                                  color: Colors.white,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Text('CONNECT',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 32,
                                                          fontFamily: "Abril")),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          }
          return WantScreen();
        });
  }
}
