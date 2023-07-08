import 'package:flutter/material.dart';

class BatteryIcon extends StatelessWidget {
  int batteryLevel;
  double segmentHeight;
  double segmentWidth;
  Color segmentColor;
  BatteryIcon(
      {Key? key,
      this.batteryLevel = 0,
      this.segmentHeight = 10,
      this.segmentWidth = 30,
      this.segmentColor = Colors.transparent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: segmentWidth * 0.5,
          height: segmentHeight * 0.6,
          decoration: BoxDecoration(
              // color: batteryLevel >= 5
              //     ? segmentColor.withOpacity(0)
              //     : Color(0xFF4E4E4E),
              gradient: batteryLevel >= 5
                  ? LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [Color(0xFF40CFA4), Color(0xFF36924B)],
                    )
                  : LinearGradient(
                      colors: [Color(0xFF4E4E4E), Color(0xFF4E4E4E)]),
              border: const Border(
                top: BorderSide(width: 1.0, color: Colors.white),
                bottom: BorderSide(width: 1.0, color: Colors.white),
                right: BorderSide(width: 1.0, color: Colors.white),
                left: BorderSide(width: 1.0, color: Colors.white),
              )),
        ),
        Container(
          width: segmentWidth,
          height: segmentHeight,
          decoration: BoxDecoration(
              // color: batteryLevel >= 4
              //     ? segmentColor.withOpacity(0)
              //     : Color(0xFF4E4E4E),
              gradient: batteryLevel >= 4
                  ? LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [Color(0xFF40CFA4), Color(0xFF36924B)],
                    )
                  : LinearGradient(
                      colors: [Color(0xFF4E4E4E), Color(0xFF4E4E4E)]),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(5), topLeft: Radius.circular(5)),
              border: Border.all(color: Colors.white, width: 1)),
        ),
        Container(
          width: segmentWidth,
          height: segmentHeight,
          decoration: BoxDecoration(
              // color: batteryLevel >= 3
              //     ? segmentColor.withOpacity(0)
              //     : Color(0xFF4E4E4E),
              gradient: batteryLevel >= 3
                  ? LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [Color(0xFF40CFA4), Color(0xFF36924B)],
                    )
                  : LinearGradient(
                      colors: [Color(0xFF4E4E4E), Color(0xFF4E4E4E)]),
              border: const Border(
                  top: BorderSide(width: 1.0, color: Colors.white),
                  bottom: BorderSide(width: 2.0, color: Colors.white),
                  right: BorderSide(width: 1.0, color: Colors.white),
                  left: BorderSide(width: 1.0, color: Colors.white))),
        ),
        Container(
          width: segmentWidth,
          height: segmentHeight,
          decoration: BoxDecoration(
              // color: batteryLevel >= 2
              //     ? segmentColor.withOpacity(0)
              //     : Color(0xFF4E4E4E),
              gradient: batteryLevel >= 2
                  ? LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [Color(0xFF40CFA4), Color(0xFF36924B)],
                    )
                  : LinearGradient(
                      colors: [Color(0xFF4E4E4E), Color(0xFF4E4E4E)]),
              // borderRadius: BorderRadius.circular(5),
              border: const Border(
                  bottom: BorderSide(width: 1.0, color: Colors.white),
                  right: BorderSide(width: 1.0, color: Colors.white),
                  left: BorderSide(width: 1.0, color: Colors.white))),
        ),
        Container(
          width: segmentWidth,
          height: segmentHeight,
          decoration: BoxDecoration(
              // color: batteryLevel >= 1
              //     ? segmentColor.withOpacity(0)
              //     : Color(0xFF4E4E4E),
              gradient: batteryLevel >= 1
                  ? LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [Color(0xFF40CFA4), Color(0xFF36924B)],
                    )
                  : LinearGradient(
                      colors: [Color(0xFF4E4E4E), Color(0xFF4E4E4E)]),
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
              border: Border.all(color: Colors.white, width: 1)),
        ),
      ],
    );
  }
}
