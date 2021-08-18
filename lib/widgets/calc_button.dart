import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CalcButton extends StatelessWidget {
  String text;
  int fillColor;
  int textColor;
  double textSize;
  Function callback;

  CalcButton({
    Key? key,
    required this.text,
    required this.fillColor,
    required this.textColor,
    required this.textSize,
    required this.callback,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        width: 60,
        height: 60,
        // ignore: deprecated_member_use
        child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            onPressed: () => callback(text),
            color: Color(fillColor),
            textColor: Color(textColor),
            child: Text(
              text,
              style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                fontSize: textSize,
              )),
            )),
      ),
    );
  }
}
