import 'package:flutter/material.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class BorderedButton extends StatelessWidget {
  const BorderedButton(this.label,
      {this.icon, required this.onTap, this.isDark = false, super.key});

  final IconData? icon;
  final String label;
  final GestureTapCallback onTap;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color:
                  isDark ? kDarkButtonBackgroundColor : kButtonBackgroundColor,
              width: 2.0,
            ),
            borderRadius: kBorderRadius,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (icon != null) ...[
                Icon(
                  icon,
                  color: isDark
                      ? kDarkButtonBackgroundColor
                      : kButtonBackgroundColor,
                ),
              ],
              Padding(
                padding: EdgeInsets.only(
                  left: icon != null ? kSpacingPadding : 0.0,
                  top: kAdjustmentPadding - 2.0,
                  bottom: kAdjustmentPadding + 1.0,
                ),
                child: Text(
                  label,
                  style: TextStyle(
                    color: isDark
                        ? kDarkButtonBackgroundColor
                        : kButtonBackgroundColor,
                    fontSize: kButtonFontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
