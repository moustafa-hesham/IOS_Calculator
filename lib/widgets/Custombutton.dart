import 'package:flutter/material.dart';

class CustomCalcButton extends StatelessWidget {
  const CustomCalcButton({
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
          shape: const StadiumBorder(),
          fixedSize: const Size(200, 90),
          backgroundColor: btnColor),
      onPressed: () {
        onClick(digit);
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            digit,
            style: TextStyle(
              fontSize: 35,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
