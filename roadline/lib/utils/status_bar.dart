import 'package:flutter/material.dart';
import 'package:roadline/styles/constants.dart';

class StatusBar {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar(
      String message, Color color, Color backgroundColor) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: color,
          fontSize: kDefaultFontSize,
          fontWeight: FontWeight.w700,
        ),
      ),
      backgroundColor: backgroundColor,
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static void showErrorMessage(String message) {
    showSnackBar(message, kErrorContentColor, kErrorBackgroundColor);
  }

  static void showSuccessMessage(String message) {
    showSnackBar(message, kSuccessContentColor, kSuccessBackgroundColor);
  }
}
