import 'package:flutter/material.dart';
import 'package:roadline/controllers/project.dart';
import 'package:roadline/partials/forms/data_input.dart';

@immutable
class DatePicker extends StatelessWidget {
  const DatePicker({required this.projectController, super.key});

  final ProjectController projectController;

  @override
  Widget build(BuildContext context) {
    return DataInput(
      value: projectController.date,
      icon: Icons.calendar_month,
      keyboardType: TextInputType.datetime,
      onChanged: (value) {
        projectController.date = value;
      },
      validator: (value) {
        return null;
      },
    );
  }
}
