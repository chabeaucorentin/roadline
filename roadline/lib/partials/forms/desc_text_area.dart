import 'package:flutter/material.dart';
import 'package:roadline/models/project.dart';
import 'package:roadline/models/task.dart';
import 'package:roadline/partials/forms/text_area.dart';

@immutable
class DescTextArea extends StatelessWidget {
  DescTextArea.project({required this.project, super.key});

  DescTextArea.task({required this.task, super.key});

  Project? project;
  Task? task;

  @override
  Widget build(BuildContext context) {
    return TextArea(
      value: project == null ? task!.notes : project!.description,
      onChanged: (value) {
        if (project == null) {
          task!.notes = value;
        } else {
          project!.description = value;
        }
      },
      validator: (value) {
        return null;
      },
    );
  }
}
