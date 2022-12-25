import 'package:flutter/material.dart';
import 'package:roadline/partials/navbar/nav_bar.dart';

@immutable
class BackNavBar extends StatelessWidget {
  const BackNavBar({this.title, super.key});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return NavBar(
      title: title,
      iconLeft: Icons.arrow_back,
      onTapLeft: () {
        Navigator.pop(context);
      },
    );
  }
}
