import 'package:flutter/material.dart';
import 'package:roadline/routes/routes.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class CounterCard extends StatefulWidget {
  const CounterCard({required this.text, required this.counter, super.key});

  final String text;
  final int counter;

  @override
  State<CounterCard> createState() => _CounterCardState();
}

class _CounterCardState extends State<CounterCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, kTasksRoute);
          },
          child: Container(
            color: kDarkBackgroundColor,
            child: Column(
              children: <Widget>[
                Text(
                  widget.counter.toString(),
                  style: const TextStyle(
                    color: kDarkSecondaryColor,
                    fontSize: kCounterSize,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: kDefaultElementSpacing / 4.0,
                ),
                Text(
                  widget.text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: kDarkPrimaryColor,
                    fontSize: kDefaultFontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
