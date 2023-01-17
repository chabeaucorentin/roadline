import 'package:flutter/material.dart';
import 'package:roadline/models/task.dart';
import 'package:roadline/partials/forms/data_input.dart';

@immutable
class ProjectDropdown extends StatelessWidget {
  const ProjectDropdown({required this.task, super.key});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return DataInput(
      value: task.title,
      icon: Icons.inventory_2,
      hintText: 'Titre du projet',
      onChanged: (value) {
        task.title = value;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Le titre du projet doit être renseigné !';
        }
        return null;
      },
    );
  }
}
