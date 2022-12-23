import 'package:flutter/material.dart';
import 'package:roadline/partials/navbar/nav_bar.dart';

@immutable
class CloseNavBar extends StatelessWidget {
  const CloseNavBar({this.title, super.key});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return NavBar(
      title: title,
      iconRight: Icons.close,
      onTapRight: () {
        Navigator.pop(context);
      },
    );
  }
}
