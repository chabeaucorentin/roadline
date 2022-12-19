import 'package:flutter/material.dart';
import 'package:roadline/partials/logos/logo.dart';

@immutable
class FormHeader extends StatelessWidget {
  const FormHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 75.0,
        ),
        child: Logo(
          isBig: true,
        ),
      ),
    );
  }
}
