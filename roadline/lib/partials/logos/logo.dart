import 'package:flutter/material.dart';

@immutable
class Logo extends StatelessWidget {
  const Logo({this.isBig = false, this.isDark = false, super.key});

  final bool isBig;
  final bool isDark;

  ImageProvider<Object> getImage() {
    if (isBig) {
      if (isDark) {
        return const AssetImage('assets/images/logo-big-dark.png');
      } else {
        return const AssetImage('assets/images/logo-big-light.png');
      }
    } else {
      if (isDark) {
        return const AssetImage('assets/images/logo-dark.png');
      } else {
        return const AssetImage('assets/images/logo-light.png');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Image(
      height: !isBig ? 30.0 : null,
      width: isBig ? 200.0 : null,
      image: getImage(),
    );
  }
}
