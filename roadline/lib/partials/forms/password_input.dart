import 'package:flutter/material.dart';
import 'package:roadline/partials/forms/data_input.dart';

@immutable
class PasswordInput extends StatelessWidget {
  const PasswordInput({this.hintText = 'Mot de passe', this.onChanged, super.key});

  final String hintText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return DataInput(
      icon: Icons.lock,
      hintText: hintText,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Le mot de passe doit être renseigné !';
        } else if (value.length < 6) {
          return 'Le mot de passe doit contenir au moins 6 caractères !';
        }
        return null;
      },
      isDark: true,
    );
  }
}
