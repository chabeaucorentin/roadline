import 'package:flutter/material.dart';
import 'package:roadline/partials/logos/logo.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class NavBar extends StatelessWidget {
  const NavBar(
      {this.title,
      this.iconLeft,
      this.onTapLeft,
      this.iconRight,
      this.onTapRight,
      super.key});

  final String? title;
  final IconData? iconLeft;
  final GestureTapCallback? onTapLeft;
  final IconData? iconRight;
  final GestureTapCallback? onTapRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: kSpacingPadding,
        horizontal: kDefaultElementSpacing - 3.0,
      ),
      constraints: const BoxConstraints(
        maxWidth: kMainMaxWidth + 6.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: onTapLeft ??
                () {
                  Navigator.pop(context);
                },
            child: Icon(
              iconLeft ?? Icons.arrow_back,
              size: kDefaultIconSize,
              color: kDarkLighterColor,
            ),
          ),
          if (title != null) ...[
            Text(
              title!,
              style: const TextStyle(
                color: kDarkLighterColor,
                fontSize: kHeaderFontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ] else ...[
            const Logo(),
          ],
          GestureDetector(
            onTap: onTapRight,
            child: Icon(
              iconRight,
              size: kDefaultIconSize,
              color: kDarkLighterColor,
            ),
          ),
        ],
      ),
    );
  }
}
