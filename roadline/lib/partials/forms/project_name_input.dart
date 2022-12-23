import 'package:flutter/material.dart';
import 'package:roadline/partials/forms/data_input.dart';

@immutable
class ProjectNameInput extends StatelessWidget {
  const ProjectNameInput({super.key});

  @override
  Widget build(BuildContext context) {
    return DataInput(
      icon: Icons.inventory_2,
      hintText: 'Titre du projet',
      validator: (val) {
        return null;
      },
    );
  }
}
