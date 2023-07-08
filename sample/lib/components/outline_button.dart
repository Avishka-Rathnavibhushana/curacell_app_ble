import 'package:flutter/material.dart';

class OutlineButton extends StatelessWidget {
  const OutlineButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  final String buttonText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 169,
      height: 45.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.5,
                ),
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                  BorderSide(
                    color: Colors.black.withOpacity(0.65),
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
                overlayColor:
                    MaterialStateProperty.resolveWith<Color>((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Color(0xFF36924B).withOpacity(0.1);
                  }
                  return Colors.transparent;
                }),
              ),
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
