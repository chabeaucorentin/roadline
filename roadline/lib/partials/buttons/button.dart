import 'package:flutter/material.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class Button extends StatelessWidget {
  const Button(this.label,
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
        child: Container(
          decoration: BoxDecoration(
            color: isDark ? kDarkButtonBackgroundColor : kButtonBackgroundColor,
            borderRadius: kBorderRadius,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (icon != null) ...[
                Icon(
                  icon,
                  color: isDark ? kDarkButtonContentColor : kButtonContentColor,
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
                    color:
                        isDark ? kDarkButtonContentColor : kButtonContentColor,
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
