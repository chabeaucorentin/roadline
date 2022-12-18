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
      children: const <Widget>[
        CounterCard(
          text: 'Tâches en cours',
          counter: 12,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 6.0,
          ),
          child: SizedBox(
            height: 55.0,
            width: kDefaultElementSpacing * 2.0,
            child: VerticalDivider(
              color: kDarkSeparatorColor,
              thickness: 1.0,
            ),
          ),
        ),
        CounterCard(
          text: 'Tâches en retard',
          counter: 5,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 6.0,
          ),
          child: SizedBox(
            height: 55,
            width: kDefaultElementSpacing * 2.0,
            child: VerticalDivider(
              color: kDarkSeparatorColor,
              thickness: 1.0,
            ),
          ),
        ),
        CounterCard(
          text: 'Tâches terminées',
          counter: 23,
        ),
      ],
    );
  }
}
