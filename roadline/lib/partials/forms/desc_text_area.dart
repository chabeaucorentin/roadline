import 'package:flutter/material.dart';
import 'package:roadline/controllers/project.dart';
import 'package:roadline/partials/forms/text_area.dart';

@immutable
class DescTextArea extends StatelessWidget {
  const DescTextArea({required this.projectController, super.key});

  final ProjectController projectController;

  @override
  Widget build(BuildContext context) {
    return TextArea(
      value: projectController.description,
      onChanged: (value) {
        projectController.description = value;
      },
      validator: (value) {
        return null;
      },
    );
  }
}
