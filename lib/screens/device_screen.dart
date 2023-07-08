import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:block_ui/block_ui.dart';
import 'package:curacell/screens/graphs_screen.dart';
import 'package:curacell/services/bluetooth_service.dart';
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;

import '../services/firebase_controller.dart';

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({Key? key}) : super(key: key);

  @override
  _DeviceScreenState createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(milliseconds: 200))
        ..repeat();
  bool pressAttentionAuto = true;
  bool pressAttentionBeast = false;
  bool pressAttentionEco = false;
  bool pressAttentionSilent = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    final providerBluetooth =
        Provider.of<BluetoothService>(context, listen: false);
    final device = providerBluetooth.targetDevice;
    providerBluetooth.disconnectFromDevice(device: device);

    super.deactivate();
  }

  snack(
      {required Color bgColor,
      required Color txtColor,
      required String message}) {
    SnackBar currentSnack = SnackBar(
        width: 200,
        behavior: SnackBarBehavior.floating,
        // margin: EdgeInsets.all(10),
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        duration: Duration(milliseconds: 900),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: GoogleFonts.josefinSans(
            color: txtColor,
            fontSize: 23,
          ),
        ));
    ScaffoldMessenger.of(context).showSnackBar(currentSnack);
  }

  @override
  void initState() {
    updateUi();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final providerBluetooth =
        Provider.of<BluetoothService>(context, listen: false);
    if (context.watch<BluetoothService>().streamFinished) {
      final firebaseProvider =
          Provider.of<AuthFunctions>(context, listen: false);
      String userId = firebaseProvider.firebaseUser!.uid;
      firebaseProvider.createAnalytics(
          "Data analytics", userId, "intTemp", providerBluetooth.intTempGraph);

      // firebaseProvider.createAnalytics(
      //     "Data analytics", userId, "extTemp", providerBluetooth.extTempGraph);
      // firebaseProvider.createAnalytics(
      //     "Data analytics", userId, "pwmVal", providerBluetooth.pwmValueGraph);
      // firebaseProvider.createAnalytics("Data analytics", userId, "feedbackVal",
      //     providerBluetooth.feedbackValueGraph);
    }
    print("Data sent");
    super.didChangeDependencies();
  }

  void updateUi() {
    final providerBluetooth =
        Provider.of<BluetoothService>(context, listen: false);
    BlockUi.show(
      context,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Container(
                margin: EdgeInsets.only(left: 30),
                child: Text("Updating..",
                    style: GoogleFonts.josefinSans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ))),
          ],
        ),
      ),
    );
    providerBluetooth.writeData("s");
    Future.delayed(const Duration(milliseconds: 100), () async {
      await Provider.of<BluetoothService>(context, listen: false)
          .targetReadCharacteristic!
          .read();
      Future.delayed(const Duration(milliseconds: 100), () async {
        providerBluetooth.writeData("g");
        Future.delayed(const Duration(milliseconds: 100), () async {
          await Provider.of<BluetoothService>(context, listen: false)
              .targetReadCharacteristic!
              .read();
          BlockUi.hide(context);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final providerBluetooth =
        Provider.of<BluetoothService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFFB3F2FD),
        elevation: 0,
        title: Text(
          "Curacell",
          style: GoogleFonts.lato(
              color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: DoubleBack(
        waitForSecondBackPress: 1,
        onFirstBackPress: (context) {
          final snackBar = SnackBar(
              padding: EdgeInsets.all(17),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              duration: Duration(milliseconds: 200),
              content: Text(
                'Press back again to Disconnect & Exit',
                style: GoogleFonts.josefinSans(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Stack(
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
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text("Thermal System",
                        style: GoogleFonts.josefinSans(
                          color: Colors.black54,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircularPercentIndicator(
                          animationDuration: 1000,
                          radius: 160,
                          lineWidth: 30,
                          animation: true,
                          percent: Provider.of<BluetoothService>(context)
                                      .intTempValue !=
                                  null
                              ? double.parse(
                                      Provider.of<BluetoothService>(context)
                                          .intTempValue!) /
                                  100
                              : 0.0,
                          center: new Text(
                            Provider.of<BluetoothService>(context)
                                        .intTempValue !=
                                    null
                                ? "${Provider.of<BluetoothService>(context).intTempValue}%"
                                : "0%",
                            style: new TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          footer: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Text(
                              "Internal Temp",
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17.0),
                            ),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Provider.of<BluetoothService>(context)
                              .defaultColor //Color(0xFF265ED7),
                          ),
                      CircularPercentIndicator(
                          animationDuration: 1000,
                          radius: 160,
                          lineWidth: 30,
                          animation: true,
                          percent: Provider.of<BluetoothService>(context)
                                      .extTempValue !=
                                  null
                              ? double.parse(
                                      Provider.of<BluetoothService>(context)
                                          .extTempValue!) /
                                  100
                              : 0.0,
                          center: new Text(
                            Provider.of<BluetoothService>(context)
                                        .extTempValue !=
                                    null
                                ? "${Provider.of<BluetoothService>(context).extTempValue}%"
                                : "0%",
                            style: new TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          footer: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Text(
                              "Ambient Temp",
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17.0),
                            ),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Provider.of<BluetoothService>(context)
                              .defaultColor //Color(0xFF265ED7),
                          ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text("Cooling System",
                        style: GoogleFonts.josefinSans(
                          color: Colors.black54,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  RepaintBoundary(
                    child: Stack(
                      alignment: Alignment(1, 0),
                      children: [
                        SizedBox(
                            height: 60,
                            child: LiquidLinearProgressIndicator(
                              value: Provider.of<BluetoothService>(context)
                                          .feedbackValue !=
                                      null
                                  ? double.parse(
                                          Provider.of<BluetoothService>(context)
                                              .feedbackValue!) /
                                      10000
                                  : 0.0, // Defaults to 0.5.
                              valueColor: AlwaysStoppedAnimation(Color(
                                  0xFFA4C9F1)), // Defaults to the current Theme's accentColor.
                              backgroundColor: Colors
                                  .white, // Defaults to the current Theme's backgroundColor.
                              borderColor:
                                  Color(0xFF3981D2), //border color of the bar
                              borderWidth: 2.0, //border width of the bar
                              borderRadius: 10.0, //border radius
                              direction: Axis.horizontal,
                              // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                              center: Text(
                                Provider.of<BluetoothService>(context)
                                            .feedbackValue !=
                                        null
                                    ? "${int.parse(Provider.of<BluetoothService>(context).feedbackValue!) / 100}%"
                                    : "0%",
                                style: GoogleFonts.josefinSans(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2),
                              ), //text inside bar
                            )),
                        AnimatedBuilder(
                          animation: _controller,
                          builder: (_, child) {
                            return Transform.rotate(
                              angle: _controller.value * 2 * math.pi,
                              child: child,
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: FaIcon(
                              FontAwesomeIcons.fan,
                              color: Colors.blueGrey.shade200,
                              size: 50,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Card(
                  //   elevation: 2,
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(23)),
                  //   child: ListTile(
                  //       leading: Icon(Icons.av_timer),
                  //       title: Text("Flow Speed"),
                  //       //dense: true,
                  //       trailing: Text(
                  //           Provider.of<BluetoothService>(context)
                  //                       .extTempValue !=
                  //                   null
                  //               ? "${Provider.of<BluetoothService>(context).extTempValue} rpm"
                  //               : "N/A",
                  //           style: TextStyle(
                  //               color: Colors.black54,
                  //               fontSize: 20,
                  //               fontWeight: FontWeight.bold))),
                  // ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FractionallySizedBox(
                      widthFactor: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 4),
                                blurRadius: 5.0)
                          ],
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFA4C9F1),
                              Color(0xFF3981D2),
                              Color(0xFF1679D9)
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(40),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            minimumSize:
                                MaterialStateProperty.all(Size(50, 50)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            // elevation: MaterialStateProperty.all(3),
                            shadowColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          onPressed: () async {
                            launch('https://curacellinnovations.com');
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) {
                            //       return GraphScreen();
                            //     },
                            //   ),
                            // );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                            ),
                            child: Text("Full Analysis",
                                style: GoogleFonts.zillaSlab(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2)),
                          ),
                        ),
                      ),
                    ),
                  ) //MODE_ROW
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
