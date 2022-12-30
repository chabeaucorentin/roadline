import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class Screen extends StatelessWidget {
  const Screen(
      {this.mainKey,
      this.drawer,
      this.isDark = true,
      this.isBottomDark = false,
      required this.child,
      super.key});

  final Key? mainKey;
  final Widget? drawer;
  final bool isDark;
  final bool isBottomDark;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        key: mainKey,
        drawer: drawer,
        backgroundColor: isBottomDark ? kDarkBackgroundColor : kBackgroundColor,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
          child: Stack(
            children: <Widget>[
              SafeArea(
                top: false,
                child: Container(
                  color: isDark ? kDarkBackgroundColor : kBackgroundColor,
                ),
              ),
              SafeArea(
                bottom: false,
                child: Container(
                  color: isBottomDark ? kDarkBackgroundColor : kBackgroundColor,
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
