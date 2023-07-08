import 'package:flutter/material.dart';
import 'package:sample/components/outline_icon_button.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
  });

  final String icon;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 61.2,
          height: 61.2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Color(0xFF36924B),
              width: 2,
              style: BorderStyle.solid,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              icon,
              color: Color(0xFF36924B),
              width: 41.47,
              height: 41.47,
            ),
          ),
        ),
        SizedBox(
          width: 22.8,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.toUpperCase(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  subTitle,
                  style: TextStyle(
                    color: Color(0xFF36924B),
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
        Spacer(),
        OutlineIconButton(
          icon: "assets/notification.png",
          onPressed: () {},
        ),
        SizedBox(
          width: 17,
        ),
        OutlineIconButton(
          icon: "assets/setting.png",
          onPressed: () {},
        ),
      ],
    );
  }
}
