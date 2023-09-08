import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  const CalcButton({
    super.key,
    required this.digit,
    required this.onClick,
    this.btnColor = const Color(0xFF303030),
    this.txtColor = Colors.white,
  });
  final String digit;
  final Color btnColor, txtColor;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          fixedSize: const Size(90, 90),
          backgroundColor: btnColor),
      onPressed: () {
        onClick(digit);
      },
      child: Text(
        digit,
        style: TextStyle(
          fontSize: 40,
          color: txtColor,
        ),
      ),
    );
  }
}
