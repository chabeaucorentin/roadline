import 'package:flutter/material.dart';
import 'package:roadline/routes/router.dart';
import 'package:roadline/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: kHomeRoute,
      routes: router,
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
    );
  }
}
