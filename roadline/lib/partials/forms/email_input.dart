import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:roadline/controllers/user_action.dart';
import 'package:roadline/partials/forms/data_input.dart';

@immutable
class EmailInput extends StatelessWidget {
  const EmailInput({required this.userActionController, super.key});

  final UserActionController userActionController;

  @override
  Widget build(BuildContext context) {
    return DataInput(
      value: userActionController.email,
      icon: Icons.email,
      hintText: 'Adresse email',
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        userActionController.email = value;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'L’adresse email doit être renseignée !';
        } else if (!EmailValidator.validate(value)) {
          return 'L’adresse email n’est pas valide !';
        }
        return null;
      },
      isDark: true,
    );
  }
}
