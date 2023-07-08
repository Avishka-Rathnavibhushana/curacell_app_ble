import 'dart:ui';
import 'package:block_ui/block_ui.dart';
import 'package:curacell/services/bluetooth_service.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({Key? key}) : super(key: key);

  @override
  _GraphScreenState createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  List<FlSpot>? createGrid(List data) {
    List<FlSpot> spots = [];

    for (double i = 0; i < data.length; i++) {
      spots.add(FlSpot(i, double.parse(data[i.toInt()])));
    }

    return spots;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFB3F2FD),
        title: Text(
          "Curacell Analysis",
          style: GoogleFonts.lato(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaY: 0, sigmaX: 0),
            child: Opacity(
              opacity: 0.3,
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
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 1.8,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 18.0, left: 12.0, top: 24, bottom: 18),
                        child: LineChart(
                          LineChartData(
                              gridData: FlGridData(
                                drawVerticalLine: false,
                                getDrawingHorizontalLine: (double value) {
                                  return FlLine(
                                    color: Colors.greenAccent,
                                    strokeWidth: 4,
                                  );
                                },
                                show: true,
                                checkToShowHorizontalLine: (double value) {
                                  return value == 30;
                                }, //avg value selected as this
                              ),
                              titlesData: FlTitlesData(
                                topTitles: SideTitles(showTitles: false),
                                rightTitles: SideTitles(showTitles: false),
                                bottomTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 5,
                                    margin: 15,
                                    getTextStyles: (context, value) =>
                                        const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                    // textStyle: yearTextStyle,
                                    getTitles: (value) {
                                      switch (value.toInt()) {
                                        case 0:
                                          return '14h ago';
                                      }
                                      return "";
                                    }),
                                leftTitles: SideTitles(
                                  getTextStyles: (context, value) =>
                                      const TextStyle(
                                    color: Colors.white70,
                                  ),
                                  interval: 5,
                                  reservedSize: 30,
                                  showTitles: true,
                                  getTitles: (value) {
                                    switch (value.toInt()) {
                                      case 0:
                                        return '';
                                      case 30:
                                        return 'Avg';
                                      default:
                                        return '$value';
                                    }
                                  },
                                ),
                              ),
                              borderData: FlBorderData(
                                  show: true,
                                  border: Border.all(
                                    color: Colors.white12,
                                    width: 2,
                                  )),
                              minX: 0,
                              minY: 15,
                              maxY: 43,
                              lineBarsData: [
                                LineChartBarData(
                                  isStrokeCapRound: true,
                                  colors: [
                                    Color(0xFF2891F0),
                                  ],
                                  dotData: FlDotData(
                                    show: false,
                                  ),
                                  belowBarData: BarAreaData(
                                    show: true,
                                    colors: [Colors.red.withOpacity(0.7)],
                                    cutOffY: 30,
                                    applyCutOffY: true,
                                  ),
                                  spots: Provider.of<BluetoothService>(context)
                                          .intTempGraph
                                          .isNotEmpty
                                      ? createGrid(
                                          Provider.of<BluetoothService>(context)
                                              .intTempGraph)
                                      : [],
                                  isCurved: true,
                                  barWidth: 3,
                                ),
                              ]),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff002963),
                            Color(0xff0A4781),
                            Color(0xff1E5B95),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                ),
                Text("Battery Temperature  (°C)",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 5,
                ),
                AspectRatio(
                  aspectRatio: 1.8,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff002963),
                            Color(0xff0A4781),
                            Color(0xff1E5B95),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 18.0, left: 12.0, top: 24, bottom: 18),
                        child: LineChart(
                          LineChartData(
                              gridData: FlGridData(
                                show: true,
                                drawVerticalLine: false,
                              ),
                              titlesData: FlTitlesData(
                                topTitles: SideTitles(showTitles: false),
                                rightTitles: SideTitles(showTitles: false),
                                bottomTitles: SideTitles(
                                    margin: 10,
                                    getTextStyles: (context, value) =>
                                        const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                    showTitles: true,
                                    reservedSize: 5,
                                    // textStyle: yearTextStyle,
                                    getTitles: (value) {
                                      switch (value.toInt()) {
                                        case 0:
                                          return '14h ago';
                                        default:
                                          return '';
                                      }
                                    }),
                                leftTitles: SideTitles(
                                  reservedSize: 30,
                                  getTextStyles: (context, value) =>
                                      const TextStyle(
                                    color: Colors.white70,
                                  ),
                                  showTitles: true,
                                  getTitles: (value) {
                                    switch (value.toInt()) {
                                      case 0:
                                        return '';
                                      default:
                                        return '${value.toInt()}';
                                    }
                                  },
                                ),
                              ),
                              borderData: FlBorderData(
                                  show: true,
                                  border: Border.all(
                                    color: Colors.white12,
                                    width: 2,
                                  )),
                              minX: 0,
                              minY: 2000,
                              maxY: 8000,
                              lineBarsData: [
                                LineChartBarData(
                                  dotData: FlDotData(
                                    show: false,
                                  ),
                                  isStrokeCapRound: true,
                                  colors: [Color(0xFF2891F0)],
                                  belowBarData: BarAreaData(
                                    show: true,
                                    colors: [
                                      Color(0xFFA4C9F1).withOpacity(0.5),
                                      Color(0xFF3981D2).withOpacity(0.4),
                                    ],
                                    applyCutOffY: false,
                                  ),
                                  spots: Provider.of<BluetoothService>(context)
                                          .feedbackValueGraph
                                          .isNotEmpty
                                      ? createGrid(
                                          Provider.of<BluetoothService>(context)
                                              .feedbackValueGraph)
                                      : [],
                                  isCurved: true,
                                  barWidth: 3,
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ),
                Text("Flow-Speed Variation  (rpm)",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
