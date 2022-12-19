import 'package:flutter/material.dart';
import 'package:roadline/partials/buttons/button.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class BottomButton extends StatelessWidget {
  const BottomButton({required this.button, super.key});

  final Button button;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: kDefaultElementSpacing,
        right: kDefaultElementSpacing,
        bottom: 44.0,
      ),
      color: kBackgroundColor,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: kMainMaxWidth,
          ),
          child: button,
        ),
      ),
    );
  }
}
