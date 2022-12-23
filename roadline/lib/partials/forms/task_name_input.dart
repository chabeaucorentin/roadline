import 'package:flutter/material.dart';
import 'package:roadline/partials/forms/data_input.dart';

@immutable
class TaskNameInput extends StatelessWidget {
  const TaskNameInput({super.key});

  @override
  Widget build(BuildContext context) {
    return DataInput(
      icon: Icons.push_pin,
      hintText: 'Titre de la tâche',
      validator: (val) {
        return null;
      },
    );
  }
}
