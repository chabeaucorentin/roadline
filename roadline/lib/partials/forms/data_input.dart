import 'package:flutter/material.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class DataInput extends StatelessWidget {
  const DataInput(
      {this.value,
      required this.icon,
      required this.hintText,
      this.keyboardType = TextInputType.text,
      this.autofocus = false,
      this.obscureText = false,
      this.onChanged,
      required this.validator,
      this.isDark = false,
      super.key});

  final String? value;
  final IconData icon;
  final String hintText;
  final TextInputType keyboardType;
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
        hintText: hintText,
        hintStyle: TextStyle(
          color: isDark ? kDarkInputContentColor : kInputContentColor,
          fontSize: kInputFontSize,
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
            left: kDefaultPadding,
            top: kSpacingPadding,
            right: kSpacingPadding,
            bottom: kSpacingPadding,
          ),
          child: Icon(
            icon,
            size: kDefaultIconSize,
            color: isDark ? kDarkInputContentColor : kInputContentColor,
          ),
        ),
        contentPadding: const EdgeInsets.only(
          left: kAdjustmentPadding,
          top: kAdjustmentPadding,
          right: kSpacingPadding,
          bottom: kAdjustmentPadding,
        ),
        filled: true,
        fillColor: isDark ? kDarkInputBackgroundColor : kInputBackgroundColor,
        focusColor: isDark ? kDarkInputContentColor : kInputContentColor,
        border: const UnderlineInputBorder(
          borderRadius: kBorderRadius,
          borderSide: BorderSide.none,
        ),
      ),
      keyboardType: keyboardType,
      style: TextStyle(
        color: isDark ? kDarkInputContentColor : kInputContentColor,
      ),
      autofocus: autofocus,
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      cursorColor: isDark ? kDarkInputContentColor : kInputContentColor,
    );
  }
}
