import 'package:flutter/material.dart';
import 'package:roadline/partials/forms/text_area.dart';

@immutable
class DescTextArea extends StatelessWidget {
  const DescTextArea({super.key});

  @override
  Widget build(BuildContext context) {
    return TextArea(
      validator: (val) {
        return null;
      },
    );
  }
}
