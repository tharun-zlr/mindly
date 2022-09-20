import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              color: const Color.fromARGB(142, 255, 77, 7),
              child: Text(
                text,
                style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 64, 255, 77)),
              ),
            ),
          ),
          Row(
            children: [
              // Padding(padding: EdgeInsets.all(25)),
              customoutlinebutton('9'),
              customoutlinebutton('8'),
              customoutlinebutton('7'),
              customoutlinebutton('+'),
            ],
          ),
          Row(
            children: [
              // Padding(padding: EdgeInsets.all(25)),
              customoutlinebutton('6'),
              customoutlinebutton('5'),
              customoutlinebutton('4'),
              customoutlinebutton('-'),
            ],
          ),
          Row(
            children: [
              // Padding(padding: EdgeInsets.all(25)),
              customoutlinebutton('3'),
              customoutlinebutton('2'),
              customoutlinebutton('1'),
              customoutlinebutton('*'),
            ],
          ),
          Row(
            children: [
              customoutlinebutton('C'),
              customoutlinebutton('0'),
              customoutlinebutton('='),
              customoutlinebutton('/'),
            ],
          ),
        ],
      ),
    );
  }

  Widget customoutlinebutton(String val) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => Calculate(val),
        child: Text(
          val,
          style: const TextStyle(
            fontSize: 70,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }

  int first = 0, second = 0;
  String res = "", text = "";
  String opp = "";
  // ignore: non_constant_identifier_names
  void Calculate(String btnText) {
    if (btnText == "C") {
      res = "";
      text = "";
      first = 0;
      second = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "*" ||
        btnText == "/") {
      first = int.parse(text);
      res = "";
      opp = btnText;
    } else if (btnText == "=") {
      second = int.parse(text);
      if (opp == "+") {
        res = (first + second).toString();
      }
      if (opp == "-") {
        res = (first - second).toString();
      }
      if (opp == "*") {
        res = (first * second).toString();
      }
      if (opp == "/") {
        res = (first ~/ second).toString();
      }
    } else {
      res = int.parse(text + btnText).toString();
    }
    setState(() {
      text = res;
    });
  }
}
