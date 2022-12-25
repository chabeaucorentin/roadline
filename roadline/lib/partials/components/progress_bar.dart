import 'package:flutter/material.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class ProgressBar extends StatelessWidget {
  const ProgressBar({required this.percent, super.key});

  final double percent;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            color: kCardContentColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(100.0)),
          ),
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: FractionallySizedBox(
            widthFactor: percent,
            child: Container(
              decoration: const BoxDecoration(
                color: kCardBackgroundColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
              ),
              height: 6.0,
            ),
          ),
        ),
      ],
    );
  }
}
