import 'package:flutter/material.dart';
import 'package:roadline/partials/forms/data_input.dart';

@immutable
class PasswordInput extends StatelessWidget {
  const PasswordInput({this.hintText = 'Mot de passe', super.key});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return DataInput(
      icon: Icons.lock,
      hintText: hintText,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      validator: (val) {
        return null;
      },
      isDark: true,
    );
  }
}
