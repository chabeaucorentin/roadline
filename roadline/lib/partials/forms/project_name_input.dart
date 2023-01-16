import 'package:flutter/material.dart';
import 'package:roadline/models/project.dart';
import 'package:roadline/partials/forms/data_input.dart';

@immutable
class ProjectNameInput extends StatelessWidget {
  const ProjectNameInput({required this.project, super.key});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return DataInput(
      value: project.title,
      icon: Icons.inventory_2,
      hintText: 'Titre du projet',
      onChanged: (value) {
        project.title = value;
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
