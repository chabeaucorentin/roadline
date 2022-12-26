import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class Screen extends StatelessWidget {
  const Screen(
      {this.mainKey,
      this.drawer,
      required this.child,
      this.bottomSafeArea = true,
      this.isDark = true,
      this.isBottomDark = false,
      super.key});

  final Key? mainKey;
  final Widget? drawer;
  final bool bottomSafeArea;
  final bool isDark;
  final bool isBottomDark;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: mainKey,
      drawer: drawer,
      backgroundColor: isBottomDark ? kDarkBackgroundColor : kBackgroundColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
        child: Stack(
          children: <Widget>[
            SafeArea(
              top: false,
              bottom: false,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: isDark ? kDarkBackgroundColor : kBackgroundColor,
                      height: double.infinity,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: !isBottomDark ? kBackgroundColor : null,
                      height: double.infinity,
                    ),
                  ),
                ],
              ),
            ),
            SafeArea(
              bottom: bottomSafeArea,
              child: ColoredBox(
                color: isBottomDark ? kDarkBackgroundColor : kBackgroundColor,
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
