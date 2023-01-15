import 'package:flutter/material.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String equation = '0';
  String result = '0';
  String expression = '';
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
      } else if (buttonText == "⌫") {
      } else if (buttonText == "=") {
      } else {
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  Widget buildButton(
      String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: buttonColor,
      ),
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      child: TextButton(
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.normal,
              color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      appBar: AppBar(title: Text('Simple Calculator')),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              equation,
              style: TextStyle(fontSize: equationFontSize),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(
              result,
              style: TextStyle(fontSize: resultFontSize),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton('C', 1, Colors.redAccent),
                      buildButton('⌫', 1, Colors.blue),
                      buildButton('÷', 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      buildButton('7', 1, Colors.grey),
                      buildButton('8', 1, Colors.grey),
                      buildButton('9', 1, Colors.grey),
                    ]),
                    TableRow(children: [
                      buildButton('4', 1, Colors.grey),
                      buildButton('5', 1, Colors.grey),
                      buildButton('6', 1, Colors.grey),
                    ]),
                    TableRow(children: [
                      buildButton('1', 1, Colors.grey),
                      buildButton('2', 1, Colors.grey),
                      buildButton('3', 1, Colors.grey),
                    ]),
                    TableRow(children: [
                      buildButton('.', 1, Colors.grey),
                      buildButton('0', 1, Colors.grey),
                      buildButton('00', 1, Colors.grey),
                    ]),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .25,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton('x', 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      buildButton('-', 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      buildButton('+', 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      buildButton('=', 2, Colors.redAccent),
                    ]),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
