import 'package:flutter/material.dart';

class OtherButton extends StatelessWidget {
  final String text;
  final double textSize;
  final Color bgColor;
  final Color textColor;
  final VoidCallback onPressed;

  const OtherButton({super.key, required this.text, required this.textSize, required this.bgColor, required this.textColor, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
          height: 100,
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: onPressed,
            child: Container(
              margin: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(50.0),
              ),
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: textSize,
                ),
              ),
            ),
          ),
        ),
    );
  }
}
