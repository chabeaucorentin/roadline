import 'package:flutter/material.dart';
import 'package:roadline/models/project.dart';
import 'package:roadline/partials/forms/data_input.dart';

@immutable
class DatePicker extends StatelessWidget {
  const DatePicker({required this.project, super.key});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return DataInput(
      value: project.endDate,
      icon: Icons.calendar_month,
      keyboardType: TextInputType.datetime,
      onChanged: (value) {
        project.endDate = value;
      },
      validator: (value) {
        return null;
      },
    );
  }
}
