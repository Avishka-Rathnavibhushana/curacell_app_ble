import 'package:flutter/material.dart';

class OutlineIconButton extends StatelessWidget {
  const OutlineIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final String icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          icon,
          width: 24.58,
          height: 24.58,
          color: Color(0xFF726C6C),
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(9)),
            color: Colors.transparent,
          ),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(7),
                    child: Image.asset(
                      icon,
                      width: 24.58,
                      height: 24.58,
                      color: Color(0xFF726C6C),
                    ),
                  ),
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                      BorderSide(
                        color: Color(0xFF726C6C),
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    overlayColor:
                        MaterialStateProperty.resolveWith<Color>((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Color(0xFF726C6C).withOpacity(0.1);
                      }
                      return Colors.transparent;
                    }),
                  ),
                  onPressed: onPressed,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
