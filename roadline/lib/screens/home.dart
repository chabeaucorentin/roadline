import 'package:flutter/material.dart';
import 'package:roadline/styles/constants.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kDarkBackgroundColor,
      body: SafeArea(
        child: Text('Home'),
      ),
    );
  }
}
