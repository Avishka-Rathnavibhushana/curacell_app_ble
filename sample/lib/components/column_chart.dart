import 'dart:async';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartSample1 extends StatefulWidget {
  const BarChartSample1({
    Key? key,
    required this.height,
    required this.title,
    required this.width,
    required this.subtitle,
   required  this.titleColor,
    required this.subtitleColor,
    required this.backgroundColor,
    required this.barColor,
    required this.barTouchedColor,
    required this.fullBarValue,
    required this.value0,
    required this.value1,
    required this.value2,
    required this.value3,
    required this.value4,
    required this.value5,
    required this.value6,
    required this.bottomTitle0,
    required this.bottomTitle1,
    required this.bottomTitle2,
    required this.bottomTitle3,
    required this.bottomTitle4,
    required this.bottomTitle5,
    required this.bottomTitle6,
    required this.description0,
    required this.description1,
    required this.description2,
   required  this.description3,
    required this.description4,
    required this.description5,
    required this.description6,
  }) : super(key: key);

  final double width;
  final double height;
  final String title;
  final String subtitle;
  final Color titleColor;
  final Color subtitleColor;
  final Color backgroundColor;
  final Color barColor;
  final Color barTouchedColor;
  final double fullBarValue;
  final double value0;
  final double value1;
  final double value2;
  final double value3;
  final double value4;
  final double value5;
  final double value6;
  final String bottomTitle0;
  final String bottomTitle1;
  final String bottomTitle2;
  final String bottomTitle3;
  final String bottomTitle4;
  final String bottomTitle5;
  final String bottomTitle6;
  final String description0;
  final String description1;
  final String description2;
  final String description3;
  final String description4;
  final String description5;
  final String description6;

  @override
  _BarChartSample1State createState() => _BarChartSample1State();
}

class _BarChartSample1State extends State<BarChartSample1> {
  //final Color barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        color: widget.backgroundColor,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    widget.title,
                    style: TextStyle(
                        color: widget.titleColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    widget.subtitle,
                    style: TextStyle(
                        color: widget.subtitleColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: BarChart(
                        mainBarData(),
                        swapAnimationDuration: animDuration,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
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
        Color barColor = Colors.white,
        double width = 22,
        List<int> showTooltips = const [],
      }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? widget.barTouchedColor : Colors.redAccent,
          width: width,
          borderSide: isTouched
              ? BorderSide(color: widget.barTouchedColor.darken(), width: 1)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: widget.fullBarValue,
            color: widget.barColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
    switch (i) {
      case 0:
        return makeGroupData(0, widget.value0,
            isTouched: i == touchedIndex);
      case 1:
        return makeGroupData(1, widget.value1,
            isTouched: i == touchedIndex);
      case 2:
        return makeGroupData(2, widget.value2,
            isTouched: i == touchedIndex);
      case 3:
        return makeGroupData(3, widget.value3,
            isTouched: i == touchedIndex);
      case 4:
        return makeGroupData(4, widget.value4,
            isTouched: i == touchedIndex);
      case 5:
        return makeGroupData(5, widget.value5,
            isTouched: i == touchedIndex);
      case 6:
        return makeGroupData(6, widget.value6,
            isTouched: i == touchedIndex);
      default:
        return throw Error();
    }
  });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String description;
              switch (group.x.toInt()) {
                case 0:
                  description = widget.description0;
                  break;
                case 1:
                  description = widget.description1;
                  break;
                case 2:
                  description = widget.description2;
                  break;
                case 3:
                  description = widget.description3;
                  break;
                case 4:
                  description = widget.description4;
                  break;
                case 5:
                  description = widget.description5;
                  break;
                case 6:
                  description = widget.description6;
                  break;
                default:
                  throw Error();
              }
              return BarTooltipItem(
                description + '\n',
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: (rod.toY - 1).toString(),
                    style: TextStyle(
                      color: widget.barTouchedColor,
                      fontSize: 16,
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
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('M', style: style);
        break;
      case 1:
        text = const Text('T', style: style);
        break;
      case 2:
        text = const Text('W', style: style);
        break;
      case 3:
        text = const Text('T', style: style);
        break;
      case 4:
        text = const Text('F', style: style);
        break;
      case 5:
        text = const Text('S', style: style);
        break;
      case 6:
        text = const Text('S', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return Padding(padding: const EdgeInsets.only(top: 16), child: text);
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