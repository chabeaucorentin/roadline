import 'package:flutter/material.dart';
import 'package:roadline/routes/routes.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class CounterCard extends StatelessWidget {
  const CounterCard({required this.text, required this.counter, super.key});

  final String text;
  final int counter;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, kTasksRoute, (Route route) => false);
          },
          child: ColoredBox(
            color: kDarkBackgroundColor,
            child: Column(
              children: <Widget>[
                Text(
                  counter.toString(),
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
                  text,
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
