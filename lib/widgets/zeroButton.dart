import '../config/config.dart';
import 'package:flutter/material.dart';

class ZeroButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ZeroButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: SizedBox(
        height: 100,
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onPressed,
          child: Container(
            margin: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: Palette.greyDarkColor,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 35),
                child: Text(
                  '0',
                  style: TextStyle(
                    color: Palette.whiteColor,
                    fontSize: TextConfig.numberTextSize,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
