import 'package:flutter/material.dart';
import 'package:roadline/controllers/user_action.dart';
import 'package:roadline/partials/forms/data_input.dart';

@immutable
class FullNameInput extends StatelessWidget {
  const FullNameInput({required this.userAction, super.key});

  final UserAction userAction;

  @override
  Widget build(BuildContext context) {
    return DataInput(
      value: userAction.fullName,
      icon: Icons.person,
      hintText: 'Nom complet',
      onChanged: (value) {
        userAction.fullName = value;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Le nom complet doit être renseigné !';
        }
        return null;
      },
      isDark: true,
    );
  }
}
