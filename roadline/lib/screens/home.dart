import 'package:flutter/material.dart';
import 'package:roadline/cards/home_card.dart';
import 'package:roadline/partials/navbar/nav_bar.dart';
import 'package:roadline/styles/constants.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const NavBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    HomeCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
