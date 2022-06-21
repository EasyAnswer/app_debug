import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'constantes.dart';

print2logs(message, name) {
  if (isDebug) {
    developer.log(message, name: name);
  }
}

Widget standardButton(
    String text, Function onPressedFunction, functionParameters) {
  return TextButton(
    onPressed: () {
      onPressedFunction(functionParameters);
    },
    child: Text(text),
    style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.red)))),
  );
}
