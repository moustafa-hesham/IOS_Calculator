import 'package:calculator_app/widgets/Custombutton.dart';
import 'package:calculator_app/widgets/buttons.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String resultText = '0';
  String operator = '';
  String lhs = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Calculator',
          style: TextStyle(fontSize: 36),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    resultText,
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: Colors.white, fontSize: 100),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  digit: 'C',
                  onClick: onClearClick,
                  btnColor: Colors.grey,
                  txtColor: Colors.black,
                ),
                CalcButton(
                  digit: '+/-',
                  onClick: onOperatorClick,
                  btnColor: Colors.grey,
                  txtColor: Colors.black,
                ),
                CalcButton(
                  digit: '%',
                  onClick: onOperatorClick,
                  btnColor: Colors.grey,
                  txtColor: Colors.black,
                ),
                CalcButton(
                  digit: '/',
                  btnColor: const Color(0xFFFFA000),
                  onClick: onOperatorClick,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  digit: '7',
                  onClick: onDigitClick,
                ),
                CalcButton(
                  digit: '8',
                  onClick: onDigitClick,
                ),
                CalcButton(
                  digit: '9',
                  onClick: onDigitClick,
                ),
                CalcButton(
                  digit: 'x',
                  btnColor: const Color(0xFFFFA000),
                  onClick: onOperatorClick,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  digit: '4',
                  onClick: onDigitClick,
                ),
                CalcButton(
                  digit: '5',
                  onClick: onDigitClick,
                ),
                CalcButton(
                  digit: '6',
                  onClick: onDigitClick,
                ),
                CalcButton(
                  digit: '-',
                  btnColor: const Color(0xFFFFA000),
                  onClick: onOperatorClick,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  digit: '1',
                  onClick: onDigitClick,
                ),
                CalcButton(
                  digit: '2',
                  onClick: onDigitClick,
                ),
                CalcButton(
                  digit: '3',
                  onClick: onDigitClick,
                ),
                CalcButton(
                  digit: '+',
                  btnColor: const Color(0xFFFFA000),
                  onClick: onOperatorClick,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomCalcButton(
                  digit: '0',
                  onClick: onDigitClick,
                ),
                CalcButton(
                  digit: '.',
                  onClick: onDigitClick,
                ),
                CalcButton(
                  digit: '=',
                  btnColor: const Color(0xFFFFA000),
                  onClick: onEqualClick,
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

//Call back function, btet3amal fe 7eta w btetnada fe 7eta
  void onDigitClick(String digit) {
    if (resultText == '0') {
      resultText = '';
    }
    resultText += digit;
    setState(() {});
  }

  void onOperatorClick(String clickedOperator) {
    if (operator.isEmpty) {
      lhs = resultText;
    } else {
      lhs = calculate(lhs, operator, resultText);
    }
    operator = clickedOperator;
    resultText = '';
    setState(() {});
    print('LHS; $lhs, Old operator: $operator, New Operator: $clickedOperator');
  }

  String calculate(String lhs, String operator, String rhs) {
    if (operator == '+') {
      return ' ${double.parse(lhs) + double.parse(rhs)}';
    } else if (operator == '-') {
      return ' ${double.parse(lhs) - double.parse(rhs)}';
    } else if (operator == 'x') {
      return ' ${double.parse(lhs) * double.parse(rhs)}';
    } else if (operator == '/') {
      return ' ${double.parse(lhs) / double.parse(rhs)}';
    } else if (operator == '%') {
      return ' ${double.parse(lhs) / 100}';
    } else {
      return '${double.parse(lhs) * -1} ';
    }
  }

  void onEqualClick(_) {
    resultText = calculate(lhs, operator, resultText);
    lhs = '';
    operator = '';
    setState(() {});
  }

  void onClearClick(_) {
    resultText = '0';
    lhs = '';
    operator = '';

    setState(() {});
  }
}
