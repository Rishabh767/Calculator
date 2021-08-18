import 'package:calculator/pages/start_page.dart';

import 'widgets/calc_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  @override
  _CalcAppState createState() => _CalcAppState();
}

class _CalcAppState extends State<CalcApp> {
  late int firstnum;
  late int secondnum;
  String history = '';
  String dispText = '';
  String result = '';
  String operation = '';

  void btnOnClick(String btnVal) {
    print(btnVal);
    if (btnVal == 'C') {
      dispText = '';
      firstnum = 0;
      secondnum = 0;
      result = '';
    } else if (btnVal == 'AC') {
      dispText = '';
      firstnum = 0;
      secondnum = 0;
      result = '';
      history = '';
    } else if (btnVal == '+/-') {
      if (dispText[0] != '-') {
        result = '-' + dispText;
      } else {
        result = dispText.substring(1);
      }
    } else if (btnVal == '<') {
      result = dispText.substring(0, dispText.length - 1);
    } else if (btnVal == 'X' ||
        btnVal == '-' ||
        btnVal == '+' ||
        btnVal == '/') {
      firstnum = int.parse(dispText);
      result = '';
      operation = btnVal;
    } else if (btnVal == '=') {
      secondnum = int.parse(dispText);

      if (operation == '+') {
        result = (firstnum + secondnum).toString();
        print(result);
        history =
            firstnum.toString() + operation.toString() + secondnum.toString();
      }
      if (operation == "-") {
        result = (firstnum - secondnum).toString();
        history =
            firstnum.toString() + operation.toString() + secondnum.toString();
      }
      if (operation == "/") {
        result = (firstnum / secondnum).toString();

        history =
            firstnum.toString() + operation.toString() + secondnum.toString();
      }
      if (operation == "X") {
        result = (firstnum * secondnum).toString();
        history =
            firstnum.toString() + operation.toString() + secondnum.toString();
      }
    } else {
      result = int.parse(dispText + btnVal).toString();
    }

    setState(() {
      dispText = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {"/": (context) => StartPage()},
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text('CALCULATOR'),
      //   ),
      //   backgroundColor: Colors.blueGrey,
      //   body: Container(
      //       margin: EdgeInsets.all(10),
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.end,
      //         children: [
      //           Container(
      //             child: Padding(
      //                 padding: EdgeInsets.only(right: 12),
      //                 child: Text(
      //                   history,
      //                   style: GoogleFonts.rubik(
      //                       fontSize: 24, color: Colors.black12),
      //                 )),
      //             alignment: Alignment(1.0, 1.0),
      //           ),
      //           Container(
      //             child: Padding(
      //                 padding: EdgeInsets.all(10),
      //                 child: Text(
      //                   dispText,
      //                   style: GoogleFonts.rubik(
      //                       fontSize: 48, color: Colors.white),
      //                 )),
      //             alignment: Alignment(1.0, 1.0),
      //           ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //             children: [
      //               CalcButton(
      //                 text: 'AC',
      //                 fillColor: 0xFFa6aea9,
      //                 textColor: 0XFF000000,
      //                 textSize: 20,
      //                 callback: btnOnClick,
      //               ),
      //               CalcButton(
      //                 text: 'C',
      //                 fillColor: 0xFFa6aea9,
      //                 textColor: 0XFF000000,
      //                 textSize: 24,
      //                 callback: btnOnClick,
      //               ),
      //               CalcButton(
      //                 text: '<',
      //                 fillColor: 0xFFed9b2b,
      //                 textColor: 0XFF000000,
      //                 textSize: 24,
      //                 callback: btnOnClick,
      //               ),
      //               CalcButton(
      //                 text: '/',
      //                 fillColor: 0xFFed9b2b,
      //                 textColor: 0XFF000000,
      //                 textSize: 24,
      //                 callback: btnOnClick,
      //               ),
      //             ],
      //           ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //             children: [
      //               CalcButton(
      //                 text: '9',
      //                 fillColor: 0xFFa6aea9,
      //                 textColor: 0XFF000000,
      //                 textSize: 24,
      //                 callback: btnOnClick,
      //               ),
      //               CalcButton(
      //                 text: '8',
      //                 fillColor: 0xFFa6aea9,
      //                 textColor: 0XFF000000,
      //                 textSize: 24,
      //                 callback: btnOnClick,
      //               ),
      //               CalcButton(
      //                 text: '7',
      //                 fillColor: 0xFFa6aea9,
      //                 textColor: 0XFF000000,
      //                 textSize: 24,
      //                 callback: btnOnClick,
      //               ),
      //               CalcButton(
      //                 text: 'X',
      //                 fillColor: 0xFFed9b2b,
      //                 textColor: 0XFF000000,
      //                 textSize: 24,
      //                 callback: btnOnClick,
      //               ),
      //             ],
      //           ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //             children: [
      //               CalcButton(
      //                 text: '6',
      //                 fillColor: 0xFFa6aea9,
      //                 textColor: 0XFF000000,
      //                 textSize: 24,
      //                 callback: btnOnClick,
      //               ),
      //               CalcButton(
      //                 text: '5',
      //                 fillColor: 0xFFa6aea9,
      //                 textColor: 0XFF000000,
      //                 textSize: 24,
      //                 callback: btnOnClick,
      //               ),
      //               CalcButton(
      //                 text: '4',
      //                 fillColor: 0xFFa6aea9,
      //                 textColor: 0XFF000000,
      //                 textSize: 24,
      //                 callback: btnOnClick,
      //               ),
      //               CalcButton(
      //                 text: '-',
      //                 fillColor: 0xFFed9b2b,
      //                 textColor: 0XFF000000,
      //                 textSize: 24,
      //                 callback: btnOnClick,
      //               ),
      //             ],
      //           ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //             children: [
      //               CalcButton(
      //                 text: '3',
      //                 fillColor: 0xFFa6aea9,
      //                 textColor: 0XFF000000,
      //                 textSize: 24,
      //                 callback: btnOnClick,
      //               ),
      //               CalcButton(
      //                 text: '2',
      //                 fillColor: 0xFFa6aea9,
      //                 textColor: 0XFF000000,
      //                 textSize: 24,
      //                 callback: btnOnClick,
      //               ),
      //               CalcButton(
      //                 text: '1',
      //                 fillColor: 0xFFa6aea9,
      //                 textColor: 0XFF000000,
      //                 textSize: 24,
      //                 callback: btnOnClick,
      //               ),
      //               CalcButton(
      //                 text: '+',
      //                 fillColor: 0xFFed9b2b,
      //                 textColor: 0XFF000000,
      //                 textSize: 24,
      //                 callback: btnOnClick,
      //               ),
      //             ],
      //           ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //             children: [
      //               CalcButton(
      //                 text: '+/-',
      //                 fillColor: 0xFFa6aea9,
      //                 textColor: 0XFF000000,
      //                 textSize: 18,
      //                 callback: btnOnClick,
      //               ),
      //               CalcButton(
      //                 text: '0',
      //                 fillColor: 0xFFa6aea9,
      //                 textColor: 0XFF000000,
      //                 textSize: 24,
      //                 callback: btnOnClick,
      //               ),
      //               CalcButton(
      //                 text: '00',
      //                 fillColor: 0xFFa6aea9,
      //                 textColor: 0XFF000000,
      //                 textSize: 24,
      //                 callback: btnOnClick,
      //               ),
      //               CalcButton(
      //                 text: '=',
      //                 fillColor: 0xFFed9b2b,
      //                 textColor: 0XFF000000,
      //                 textSize: 24,
      //                 callback: btnOnClick,
      //               ),
      //             ],
      //           ),
      //         ],
      //       )),
      // ),
    );
  }
}
