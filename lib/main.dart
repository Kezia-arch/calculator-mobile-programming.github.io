import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const CalculatorHome(title: 'CALCULATOR'),
    );
  }
}

class CalculatorHome extends StatefulWidget {
  const CalculatorHome({super.key, required this.title});

  final String title;

  @override
  State<CalculatorHome> createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String e = '0';
  String result = '0';
  String operation = '';
  double num1 = 0;
  double num2 = 0;

  void buttonPressed(String btnText) {
    setState(() {
      if (btnText == 'AC') {
        e = '0';
        result = '0';
        num1 = 0;
        num2 = 0;
        operation = '';
      } else if (btnText == 'B') {
        e = e.substring(0, e.length - 1);
        if (e == '') {
          e = '0';
        }
      } else if (btnText == '%' || btnText == '/' || btnText == 'x' || btnText == '-' || btnText == '+') {
        num1 = double.parse(e);
        operation = btnText;
        e = '0';
      } else if (btnText == '=') {
        num2 = double.parse(e);
        switch (operation) {
          case '+':
            result = (num1 + num2).toString();
            break;
          case '-':
            result = (num1 - num2).toString();
            break;
          case 'x':
            result = (num1 * num2).toString();
            break;
          case '/':
            if (num2 != 0) {
              result = (num1 / num2).toString();
            } else {
              result = 'Error';
            }
            break;
          case '%':
            result = (num1 % num2).toString();
            break;
          default:
            result = e;
            break;
        }
        e = result;
        num1 = 0;
        num2 = 0;
        operation = '';
      } else {
        if (e == '0') {
          e = btnText;
        } else {
          e = e + btnText;
        }
      }
    });
  }

  Widget calButton(String btnText, Color txtColor, double btnWidth, Color btnColor) {
    return InkWell(
      onTap: () {
        buttonPressed(btnText);
      },
      child: Container(
        alignment: Alignment.center,
        height: 80,
        width: btnWidth,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          btnText,
          style: TextStyle(color: txtColor, fontSize: 30, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[900],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'CALCULATOR',
          style: TextStyle(color: Colors.white, fontSize: 38, fontWeight: FontWeight.normal),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            alignment: Alignment.centerRight,
            height: 100,
            width: double.infinity,
            color: Colors.teal[900],
            child: Text(
              e,
              style: TextStyle(color: Colors.white, fontSize: 60),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            alignment: Alignment.centerRight,
            height: 120,
            width: double.infinity,
            color: Colors.teal[900],
            child: Text(
              result,
              style: TextStyle(color: Colors.white, fontSize: 80),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButton('AC', Colors.white, 80, Colors.teal[400]!),
                    calButton('B', Colors.white, 80, Colors.teal[300]!),
                    calButton('%', Colors.white, 80, Colors.teal[300]!),
                    calButton('/', Colors.white, 80, Colors.teal[200]!),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButton('7', Colors.white, 80, Colors.teal[700]!),
                    calButton('8', Colors.white, 80, Colors.teal[700]!),
                    calButton('9', Colors.white, 80, Colors.teal[700]!),
                    calButton('x', Colors.white, 80, Colors.teal[200]!),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButton('4', Colors.white, 80, Colors.teal[700]!),
                    calButton('5', Colors.white, 80, Colors.teal[700]!),
                    calButton('6', Colors.white, 80, Colors.teal[700]!),
                    calButton('-', Colors.white, 80, Colors.teal[200]!),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButton('1', Colors.white, 80, Colors.teal[700]!),
                    calButton('2', Colors.white, 80, Colors.teal[700]!),
                    calButton('3', Colors.white, 80, Colors.teal[700]!),
                    calButton('+', Colors.white, 80, Colors.teal[200]!),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButton('0', Colors.white, 170, Colors.teal[700]!),
                    calButton('.', Colors.white, 80, Colors.teal[700]!),
                    calButton('=', Colors.white, 80, Colors.teal[200]!),
                  ],
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        ],
      ),
    );
  }
}