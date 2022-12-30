import 'package:flutter/material.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class DataInput extends StatelessWidget {
  const DataInput(
      {this.value,
      required this.icon,
      this.hintText,
      this.keyboardType = TextInputType.text,
      this.autofocus = false,
      this.obscureText = false,
      this.onChanged,
      required this.validator,
      this.isDark = false,
      super.key});

  final String? value;
  final IconData icon;
  final String? hintText;
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
          fontWeight: FontWeight.w700,
        ),
        errorStyle: const TextStyle(
          color: kErrorLabelColor,
          fontSize: kDefaultFontSize,
          fontWeight: FontWeight.w700,
        ),
        errorMaxLines: 2,
        contentPadding: const EdgeInsets.only(
          left: kAdjustmentPadding,
          top: kAdjustmentPadding - 2.0,
          right: kSpacingPadding,
          bottom: kAdjustmentPadding + 1.0,
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
            size: kDefaultInputIconSize,
            color: isDark ? kDarkInputContentColor : kInputContentColor,
          ),
        ),
        filled: true,
        fillColor: isDark ? kDarkInputBackgroundColor : kInputBackgroundColor,
        focusColor: isDark ? kDarkInputContentColor : kInputContentColor,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: kErrorBorderColor,
            width: 3.0,
          ),
          borderRadius: kBorderRadius,
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: kErrorBorderColor,
            width: 3.0,
          ),
          borderRadius: kBorderRadius,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: kBorderRadius,
        ),
      ),
      keyboardType: keyboardType,
      style: TextStyle(
        color: isDark ? kDarkInputContentColor : kInputContentColor,
        fontSize: kInputFontSize,
        fontWeight: FontWeight.w500,
      ),
      autofocus: autofocus,
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      cursorColor: isDark ? kDarkInputContentColor : kInputContentColor,
    );
  }
}
