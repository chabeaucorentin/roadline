import 'package:flutter/material.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class ProgressBar extends StatefulWidget {
  const ProgressBar({required this.percent, super.key});

  final double percent;

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 10.0,
          decoration: const BoxDecoration(
            color: kCardContentColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(100.0)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: FractionallySizedBox(
            widthFactor: widget.percent,
            child: Container(
              height: 6.0,
              decoration: const BoxDecoration(
                color: kCardBackgroundColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
