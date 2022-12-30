import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:roadline/partials/forms/data_input.dart';

@immutable
class EmailInput extends StatelessWidget {
  const EmailInput({this.onChanged, super.key});

  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return DataInput(
      icon: Icons.email,
      hintText: 'Adresse email',
      keyboardType: TextInputType.emailAddress,
      onChanged: onChanged,
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
