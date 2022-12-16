import 'package:flutter/material.dart';
import 'package:roadline/cards/counter_card.dart';
import 'package:roadline/partials/buttons/button.dart';
import 'package:roadline/routes/routes.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class HomeCard extends StatefulWidget {
  const HomeCard({super.key});

  @override
  State<HomeCard> createState() => _CounterCardState();
}

class _CounterCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultElementSpacing,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: kDefaultElementSpacing * 1.5,
          ),
          const Text(
            'Bonjour, Corentin Chabeau',
            style: TextStyle(
              color: kDarkPrimaryColor,
              fontSize: kCardTitleFontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: kDefaultElementSpacing / 2.0,
          ),
          const Text(
            'Jeudi, 24 novembre 2022',
            style: TextStyle(
              color: kDarkCaptionColor,
              fontSize: kDefaultFontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: kDefaultElementSpacing * 1.5,
          ),
          Row(
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
                  height: 55,
                  width: kDefaultElementSpacing * 2,
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
                  width: kDefaultElementSpacing * 2,
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
          ),
          const SizedBox(
            height: kDefaultElementSpacing * 2,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Button(
                  "Projets",
                  icon: Icons.inventory_2,
                  onTap: () {
                    Navigator.pushNamed(
                        context, kRegisterRoute);
                  },
                  isDark: true,
                ),
              ),
              const SizedBox(
                width: kDefaultElementSpacing,
              ),
              Expanded(
                child: Button(
                  "Tâches",
                  icon: Icons.checklist,
                  onTap: () {
                    Navigator.pushNamed(
                        context, kRegisterRoute);
                  },
                  isDark: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
