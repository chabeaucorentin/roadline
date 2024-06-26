import 'package:flutter/material.dart';
import 'package:roadline/models/task.dart';
import 'package:roadline/partials/forms/data_input.dart';

@immutable
class TaskNameInput extends StatelessWidget {
  const TaskNameInput({required this.task, super.key});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return DataInput(
      value: task.title,
      icon: Icons.push_pin,
      hintText: 'Titre de la tâche',
      onChanged: (value) {
        task.title = value;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Le titre de la tâche doit être renseigné !';
        }
        return null;
      },
    );
  }
}
