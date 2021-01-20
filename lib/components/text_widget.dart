import 'package:flutter/material.dart';

Widget TextWidget({String text1, String text2}) {
  return Row(
    children: <Widget>[
      Text(
        text1 + "  ",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      Text(
        text2,
        style: TextStyle(
          fontSize: 16,
        ),
      )
    ],
  );
}
