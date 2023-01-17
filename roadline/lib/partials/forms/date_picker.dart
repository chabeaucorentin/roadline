import 'package:flutter/material.dart';
import 'package:roadline/models/project.dart';
import 'package:roadline/models/task.dart';
import 'package:roadline/partials/forms/data_input.dart';

@immutable
class DatePicker extends StatelessWidget {
  DatePicker.project({required this.project, super.key});

  DatePicker.task({required this.task, super.key});

  Project? project;
  Task? task;

  @override
  Widget build(BuildContext context) {
    return DataInput(
      value: project == null ? task!.date : project!.endDate,
      icon: Icons.calendar_month,
      keyboardType: TextInputType.datetime,
      onChanged: (value) {
        if (project == null) {
          task!.date = value;
        } else {
          project!.endDate = value;
        }
      },
      validator: (value) {
        return null;
      },
    );
  }
}
