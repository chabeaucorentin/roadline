import 'package:flutter/material.dart';
import 'package:roadline/partials/forms/data_input.dart';

@immutable
class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return DataInput(
      icon: Icons.email,
      hintText: 'Adresse email',
      keyboardType: TextInputType.emailAddress,
      validator: (val) {
        return null;
      },
      isDark: true,
    );
  }
}
