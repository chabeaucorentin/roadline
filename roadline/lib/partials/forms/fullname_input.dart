import 'package:flutter/material.dart';
import 'package:roadline/partials/forms/data_input.dart';

@immutable
class FullNameInput extends StatelessWidget {
  const FullNameInput({super.key});

  @override
  Widget build(BuildContext context) {
    return DataInput(
      icon: Icons.person,
      hintText: 'Nom complet',
      validator: (val) {
        return null;
      },
      isDark: true,
    );
  }
}
