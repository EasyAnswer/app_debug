import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'constantes.dart';

print2logs(message, name) {
  if (isDebug) {
    developer.log(message, name: name);
  }
}

Widget standardButton(
    String text, Function onPressedFunction, functionParameters,
    {Color buttonColor = Colors.redAccent, Color textColor = Colors.white}) {
  return TextButton(
    onPressed: () {
      onPressedFunction(functionParameters);
    },
    style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(textColor),
        backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: buttonColor)))),
    child: Text(text),
  );
}
