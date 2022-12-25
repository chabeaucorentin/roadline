import 'package:flutter/material.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class ArrowButton extends StatelessWidget {
  const ArrowButton(this.label,
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
          padding: EdgeInsets.only(
            left: (icon != null ? 2.0 : 5.0) + kAdjustmentPadding,
            right: kAdjustmentPadding,
          ),
          decoration: BoxDecoration(
            color: isDark ? kDarkButtonBackgroundColor : kButtonBackgroundColor,
            borderRadius: kBorderRadius,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              if (icon != null) ...[
                Icon(
                  icon,
                  color: isDark ? kDarkButtonContentColor : kButtonContentColor,
                ),
              ],
              Expanded(
                child: Padding(
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
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: isDark ? kDarkButtonContentColor : kButtonContentColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
