import 'package:flutter/material.dart';
import 'package:roadline/models/project.dart';
import 'package:roadline/partials/forms/text_area.dart';

@immutable
class DescTextArea extends StatelessWidget {
  const DescTextArea({required this.project, super.key});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return TextArea(
      value: project.description,
      onChanged: (value) {
        project.description = value;
      },
      validator: (value) {
        return null;
      },
    );
  }
}
