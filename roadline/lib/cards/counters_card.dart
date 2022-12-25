import 'package:flutter/material.dart';
import 'package:roadline/cards/counter_card.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class CountersCard extends StatelessWidget {
  const CountersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const CounterCard(
          text: 'Tâches en cours',
          counter: 12,
        ),
        Container(
          padding: const EdgeInsets.only(
            top: 6.0,
          ),
          width: kDefaultElementSpacing * 2.0,
          height: 55.0,
          child: const VerticalDivider(
            color: kDarkSeparatorColor,
            thickness: 1.0,
          ),
        ),
        const CounterCard(
          text: 'Tâches en retard',
          counter: 5,
        ),
        Container(
          padding: const EdgeInsets.only(
            top: 6.0,
          ),
          width: kDefaultElementSpacing * 2.0,
          height: 55,
          child: const VerticalDivider(
            color: kDarkSeparatorColor,
            thickness: 1.0,
          ),
        ),
        const CounterCard(
          text: 'Tâches terminées',
          counter: 23,
        ),
      ],
    );
  }
}
