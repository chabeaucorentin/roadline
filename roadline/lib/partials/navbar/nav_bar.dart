import 'package:flutter/material.dart';
import 'package:roadline/partials/logos/logo.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: kSpacingPadding,
        horizontal: kDefaultElementSpacing - 3,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          Icon(
            Icons.menu,
            size: 35.0,
            color: kDarkLighterColor,
          ),
          Logo(),
          Icon(
            Icons.account_circle,
            size: 35.0,
            color: kDarkLighterColor,
          ),
        ],
      ),
    );
  }
}
