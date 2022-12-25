import 'package:flutter/material.dart';
import 'package:roadline/partials/navbar/nav_bar.dart';
import 'package:roadline/routes/routes.dart';

@immutable
class MainNavBar extends StatelessWidget {
  const MainNavBar({required this.mainKey, this.title, super.key});

  final GlobalKey<ScaffoldState> mainKey;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return NavBar(
      title: title,
      iconLeft: Icons.menu,
      onTapLeft: () {
        mainKey.currentState?.openDrawer();
      },
      iconRight: Icons.account_circle,
      onTapRight: () {
        Navigator.pushNamed(context, kProfileRoute);
      },
    );
  }
}
