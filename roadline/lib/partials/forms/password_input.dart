import 'package:flutter/material.dart';
import 'package:roadline/controllers/user_action.dart';
import 'package:roadline/partials/forms/data_input.dart';

@immutable
class PasswordInput extends StatelessWidget {
  const PasswordInput({required this.userAction, this.isConfirm = false, super.key});

  final UserActionController userAction;
  final bool isConfirm;

  @override
  Widget build(BuildContext context) {
    return DataInput(
      value: isConfirm ? userAction.confirmPassword : userAction.password,
      icon: Icons.lock,
      hintText: isConfirm ? 'Confirmez le mot de passe' : 'Mot de passe',
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      onChanged: (value) {
        isConfirm ? userAction.confirmPassword = value : userAction.password = value;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Le mot de passe doit être renseigné !';
        } else if (value.length < 6) {
          return 'Le mot de passe doit contenir au moins 6 caractères !';
        } else if (isConfirm && userAction.confirmPassword != userAction.password) {
          return 'Les mots de passe ne correspondent pas !';
        }
        return null;
      },
      isDark: true,
    );
  }
}
