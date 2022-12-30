import 'package:flutter/material.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class TextArea extends StatelessWidget {
  const TextArea(
      {this.value,
      this.autofocus = false,
      this.obscureText = false,
      this.onChanged,
      required this.validator,
      this.isDark = false,
      super.key});

  final String? value;
  final bool autofocus;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String> validator;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(kAdjustmentPadding),
        filled: true,
        fillColor: isDark ? kDarkInputBackgroundColor : kInputBackgroundColor,
        focusColor: isDark ? kDarkInputContentColor : kInputContentColor,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: kBorderRadius,
        ),
      ),
      keyboardType: TextInputType.multiline,
      style: TextStyle(
        color: isDark ? kDarkInputContentColor : kInputContentColor,
        fontWeight: FontWeight.w500,
      ),
      autofocus: autofocus,
      obscureText: obscureText,
      maxLines: 10,
      onChanged: onChanged,
      validator: validator,
      cursorColor: isDark ? kDarkInputContentColor : kInputContentColor,
    );
  }
}
