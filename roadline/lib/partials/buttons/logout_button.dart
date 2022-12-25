import 'package:flutter/material.dart';
import 'package:roadline/routes/routes.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, kLoginRoute);
        },
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: kLogoutButtonBackgroundColor,
            borderRadius: kBorderRadius,
          ),
          padding: const EdgeInsets.only(
            top: kAdjustmentPadding - 2.0,
            bottom: kAdjustmentPadding + 1.0,
          ),
          child: const Text(
            'Déconnexion',
            style: TextStyle(
              color: kLogoutButtonContentColor,
              fontSize: kButtonFontSize,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
