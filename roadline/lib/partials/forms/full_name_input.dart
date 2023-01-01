import 'package:flutter/material.dart';
import 'package:roadline/controllers/user_action.dart';
import 'package:roadline/partials/forms/data_input.dart';

@immutable
class FullNameInput extends StatelessWidget {
  const FullNameInput({required this.userActionController, super.key});

  final UserActionController userActionController;

  @override
  Widget build(BuildContext context) {
    return DataInput(
      value: userActionController.fullName,
      icon: Icons.person,
      hintText: 'Nom complet',
      onChanged: (value) {
        userActionController.fullName = value;
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
