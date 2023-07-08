import 'package:flutter/material.dart';

class AdvanceScreen extends StatefulWidget {
  @override
  _AdvanceScreenState createState() => _AdvanceScreenState();
}

class _AdvanceScreenState extends State<AdvanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Advance Screen",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
