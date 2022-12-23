import 'package:flutter/material.dart';
import 'package:roadline/partials/forms/data_input.dart';

@immutable
class DatePicker extends StatelessWidget {
  const DatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return DataInput(
      value: '24 novembre 2001',
      icon: Icons.calendar_month,
      keyboardType: TextInputType.datetime,
      validator: (val) {
        return null;
      },
    );
  }
}
