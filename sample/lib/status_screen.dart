import 'package:dotted_border/dotted_border.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sample/components/header_bar.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'components/battery_icon.dart';
import 'dart:math' as math;

class StatusScreen extends StatefulWidget {
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  var dateList = [];
  var maxValue = 0;

  Color barTouchedColor = Colors.red;

  List<String> monthList = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "Septemebr",
    "October",
    "November",
    "December",
  ];

  void generatePast7Days() {
    dateList = [];
    for (var i = 0; i < 14; i++) {
      DateTime now = new DateTime.now().subtract(Duration(days: i));
      DateTime date = new DateTime(now.year, now.month, now.day);

      int v = i + 5;
      dateList.add({
        "month": monthList[date.month - 1],
        "day": date.day.toString(),
        "value": v,
        "colors": [Color(0xFF40CFA4), Color(0xFF36924B)],
      });

      if (v > maxValue) {
        maxValue = v;
      }
    }
    print(dateList);
  }

  @override
  void initState() {
    super.initState();
    generatePast7Days();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: HeaderBar(
                icon: "assets/data-analysis.png",
                title: "Status",
                subTitle: "Vehicle Battery",
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xFFDCF1E6),
                              // border: Border.all(
                              //   color: Color(0xFF7C7C7C).withOpacity(0.25),
                              //   width: 1,
                              // ),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  blurRadius: 4,
                                  blurStyle: BlurStyle.outer,
                                  color: Color(0xFF000000).withOpacity(0.5),
                                  offset: Offset(2, 2),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Battery",
                                      style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Container(
                                    height: 150,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 150,
                                            child: BarChart(
                                              mainBarData(),
                                              swapAnimationDuration:
                                                  animDuration,
                                            ),
                                          ),
                                        ),
                                        FittedBox(
                                          child: DottedBorder(
                                            borderType: BorderType.RRect,
                                            radius: Radius.circular(11),
                                            dashPattern: [2, 2],
                                            color: Colors.black,
                                            strokeWidth: 1,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 28,
                                                      horizontal: 8),
                                              child: ShaderMask(
                                                shaderCallback: (bounds) =>
                                                    LinearGradient(
                                                  colors: [
                                                    Color(0xFFEC920A),
                                                    Color(0xFFA65D07),
                                                  ],
                                                ).createShader(bounds),
                                                child: Text(
                                                  "55%",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Status :  ",
                                          style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "Battery in Bad condition with 5,7,9 cells",
                                            style: TextStyle(
                                              color: Color(0xFF000000),
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            maxLines: 2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xFFDCF1E6),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  blurRadius: 4,
                                  blurStyle: BlurStyle.outer,
                                  color: Color(0xFF000000).withOpacity(0.5),
                                  offset: Offset(2, 2),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Fan Speed & SHO",
                                      style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Container(
                                    height: 150,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            child: SfRadialGauge(
                                              enableLoadingAnimation: true,
                                              axes: <RadialAxis>[
                                                RadialAxis(
                                                  minimum: 0,
                                                  maximum: 5.0,
                                                  ranges: <GaugeRange>[
                                                    GaugeRange(
                                                      startValue: 0,
                                                      endValue: 2.5,
                                                      color: Colors.black,
                                                      labelStyle:
                                                          GaugeTextStyle(
                                                        fontSize: 6.3,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                  axisLineStyle: AxisLineStyle(
                                                    cornerStyle:
                                                        CornerStyle.endCurve,
                                                  ),
                                                  pointers: <GaugePointer>[
                                                    NeedlePointer(
                                                      value: 2.5,
                                                      lengthUnit: GaugeSizeUnit
                                                          .logicalPixel,
                                                      needleLength: 30,
                                                      needleStartWidth: 0,
                                                      needleEndWidth: 10,
                                                      knobStyle: KnobStyle(
                                                        knobRadius: 10,
                                                        sizeUnit: GaugeSizeUnit
                                                            .logicalPixel,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                  annotations: <
                                                      GaugeAnnotation>[
                                                    GaugeAnnotation(
                                                      widget: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            2.63.toString() +
                                                                " Krpm",
                                                            style: TextStyle(
                                                              fontSize: 11.7,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                          ),
                                                          Text(
                                                            "Fan Speed",
                                                            style: TextStyle(
                                                              fontSize: 7,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.4),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      angle: 90,
                                                      positionFactor: 0.9,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: SfRadialGauge(
                                              enableLoadingAnimation: true,
                                              axes: <RadialAxis>[
                                                RadialAxis(
                                                  minimum: 0,
                                                  maximum: 100,
                                                  ranges: <GaugeRange>[
                                                    GaugeRange(
                                                      startValue: 0,
                                                      endValue: 50,
                                                      color: Colors.black,
                                                      labelStyle:
                                                          GaugeTextStyle(
                                                        fontSize: 6.3,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                  axisLineStyle: AxisLineStyle(
                                                    cornerStyle:
                                                        CornerStyle.endCurve,
                                                  ),
                                                  pointers: <GaugePointer>[
                                                    NeedlePointer(
                                                      value: 50,
                                                      lengthUnit: GaugeSizeUnit
                                                          .logicalPixel,
                                                      needleLength: 30,
                                                      needleStartWidth: 0,
                                                      needleEndWidth: 10,
                                                      knobStyle: KnobStyle(
                                                        knobRadius: 10,
                                                        sizeUnit: GaugeSizeUnit
                                                            .logicalPixel,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                  annotations: <
                                                      GaugeAnnotation>[
                                                    GaugeAnnotation(
                                                      widget: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            2.63.toString() +
                                                                " %",
                                                            style: TextStyle(
                                                              fontSize: 11.7,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                          ),
                                                          Text(
                                                            "SHO",
                                                            style: TextStyle(
                                                              fontSize: 7,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.4),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      angle: 90,
                                                      positionFactor: 0.9,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color(0xFFDCF1E6),
                                    // border: Border.all(
                                    //   color: Color(0xFF7C7C7C).withOpacity(0.25),
                                    //   width: 1,
                                    // ),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        blurRadius: 4,
                                        blurStyle: BlurStyle.outer,
                                        color:
                                            Color(0xFF000000).withOpacity(0.5),
                                        offset: Offset(2, 2),
                                        spreadRadius: 0,
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Capacity",
                                            style: TextStyle(
                                              color: Color(0xFF000000),
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: 95,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  height: 95,
                                                  child: Center(
                                                    child: Transform.rotate(
                                                      angle: math.pi / 2.0,
                                                      child: BatteryIcon(
                                                        segmentHeight: 20,
                                                        segmentWidth: 90,
                                                        segmentColor:
                                                            Color(0xFF36924B),
                                                        batteryLevel: 3,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              FittedBox(
                                                child: DottedBorder(
                                                  borderType: BorderType.RRect,
                                                  radius: Radius.circular(11),
                                                  dashPattern: [2, 2],
                                                  color: Colors.black,
                                                  strokeWidth: 1,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 9,
                                                        horizontal: 4),
                                                    child: ShaderMask(
                                                      shaderCallback:
                                                          (bounds) =>
                                                              LinearGradient(
                                                        colors: [
                                                          Color(0xFF40CFA4),
                                                          Color(0xFF36924B),
                                                        ],
                                                      ).createShader(bounds),
                                                      child: Text(
                                                        "82%",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
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
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xFFDCF1E6),
                                  // border: Border.all(
                                  //   color: Color(0xFF7C7C7C).withOpacity(0.25),
                                  //   width: 1,
                                  // ),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      blurRadius: 4,
                                      blurStyle: BlurStyle.outer,
                                      color: Color(0xFF000000).withOpacity(0.5),
                                      offset: Offset(2, 2),
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Container(
                                    height: 120,
                                    width: 90,
                                    child: CircularPercentIndicator(
                                      radius: 50,
                                      lineWidth: 13,
                                      percent: 0.75,
                                      center: Container(
                                        width: 55,
                                        height: 55,
                                        child: FittedBox(
                                          child: Column(
                                            children: [
                                              Text(
                                                "80 C",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "Temperature ",
                                                style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.6),
                                                  fontSize: 9,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      circularStrokeCap:
                                          CircularStrokeCap.round,
                                      backgroundColor:
                                          Color(0xFFCE3403).withOpacity(0.19),
                                      // progressColor: Colors.blue[500],

                                      linearGradient: LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                        colors: [
                                          Color(0xFF40CFA4),
                                          Color(0xFF36924B)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = const Color(0xFFDCF1E6),
    double width = 11,
    List<int> showTooltips = const [],
    required List<Color> colors,
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          // color: isTouched ? barTouchedColor : Color(0xFF36924B),
          gradient: LinearGradient(colors: colors),
          width: width,
          borderSide: isTouched
              ? BorderSide(color: barTouchedColor.darken(), width: 1)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: (double.parse(maxValue.toString()).roundToDouble() +
                    double.parse(maxValue.toString()).roundToDouble() * 0.2)
                .roundToDouble(),
            color: barColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() =>
      List.generate(dateList.length, (i) {
        for (var j = 0; j < dateList.length; j++) {
          if (i == j) {
            return makeGroupData(
                i,
                double.parse(
                    dateList[dateList.length - 1 - i]["value"].toString()),
                isTouched: i == touchedIndex,
                colors: dateList[dateList.length - 1 - i]["colors"]);
          }
        }

        return throw Error();
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Color(0xFF36924B).withOpacity(0.9),
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String description = "";
              for (var i = 0; i < dateList.length; i++) {
                if (group.x == i) {
                  description = dateList[dateList.length - 1 - group.x]
                          ["month"] +
                      ", " +
                      dateList[dateList.length - 1 - group.x]["day"];
                  break;
                }
              }

              return BarTooltipItem(
                description + "\n",
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: (rod.toY - 1).toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            }),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xFF010101),
      fontWeight: FontWeight.normal,
      fontSize: 7,
    );
    Widget text = Text("1");
    for (var i = 0; i < dateList.length; i++) {
      if (value.toInt() == i) {
        text = Text(
            dateList[dateList.length - 1 - value.toInt()]["day"].toString(),
            style: style);
        break;
      }
    }

    return Padding(padding: const EdgeInsets.only(top: 5), child: text);
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
        animDuration + const Duration(milliseconds: 50));
  }
}

extension ColorExtension on Color {
  /// Convert the color to a darken color based on the [percent]
  Color darken([int percent = 40]) {
    assert(1 <= percent && percent <= 100);
    final value = 1 - percent / 100;
    return Color.fromARGB(alpha, (red * value).round(), (green * value).round(),
        (blue * value).round());
  }
}
