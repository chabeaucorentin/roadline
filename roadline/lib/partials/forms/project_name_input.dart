import 'package:flutter/material.dart';
import 'package:roadline/controllers/project.dart';
import 'package:roadline/partials/forms/data_input.dart';

@immutable
class ProjectNameInput extends StatelessWidget {
  const ProjectNameInput({required this.projectController, super.key});

  final ProjectController projectController;

  @override
  Widget build(BuildContext context) {
    return DataInput(
      value: projectController.title,
      icon: Icons.inventory_2,
      hintText: 'Titre du projet',
      onChanged: (value) {
        projectController.title = value;
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
