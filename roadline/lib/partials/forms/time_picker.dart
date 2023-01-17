import 'package:flutter/material.dart';
import 'package:roadline/models/task.dart';
import 'package:roadline/partials/forms/data_input.dart';

@immutable
class TimePicker extends StatelessWidget {
  const TimePicker({required this.task, super.key});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return DataInput(
      value: task.time,
      icon: Icons.schedule,
      keyboardType: TextInputType.datetime,
      onChanged: (value) {
        task.time = value;
      },
      validator: (value) {
        return null;
      },
    );
  }
}
