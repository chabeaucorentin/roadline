import 'package:flutter/material.dart';
import 'package:roadline/partials/forms/data_input.dart';

@immutable
class TimePicker extends StatelessWidget {
  const TimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return DataInput(
      value: '12:24',
      icon: Icons.schedule,
      keyboardType: TextInputType.datetime,
      validator: (value) {
        return null;
      },
    );
  }
}
