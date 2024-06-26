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
    return ColoredBox(
      color: kDarkBackgroundColor,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: kSpacingPadding,
            horizontal: kDefaultElementSpacing - 5.0,
          ),
          color: kDarkBackgroundColor,
          constraints: const BoxConstraints(
            maxWidth: kMainMaxWidth + kDefaultElementSpacing * 2.0 - 1.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MouseRegion(
                cursor: onTapLeft != null
                    ? SystemMouseCursors.click
                    : MouseCursor.defer,
                child: GestureDetector(
                  onTap: onTapLeft,
                  child: Icon(
                    iconLeft,
                    size: kDefaultIconSize,
                    color: kDarkLighterColor,
                  ),
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
              MouseRegion(
                cursor: onTapRight != null
                    ? SystemMouseCursors.click
                    : MouseCursor.defer,
                child: GestureDetector(
                  onTap: onTapRight,
                  child: Icon(
                    iconRight,
                    size: kDefaultIconSize,
                    color: kDarkLighterColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
