import 'package:flutter/material.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class Link extends StatelessWidget {
  const Link(this.text,
      {required this.onTap,
      this.isBig = false,
      this.isDark = false,
      super.key});

  final String text;
  final GestureTapCallback onTap;
  final bool isBig;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          style: TextStyle(
            color: isDark ? kDarkLinkColor : kLinkColor,
            fontSize: isBig ? kBigFontSize : kDefaultFontSize,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
