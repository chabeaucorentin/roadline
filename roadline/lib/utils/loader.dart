import 'package:flutter/material.dart';
import 'package:roadline/styles/constants.dart';

class Loader {
  static void showSpinner(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: kDarkLighterColor,
        ),
      ),
    );
  }
}
