import 'package:flutter/material.dart';
import 'package:roadline/cards/counters_card.dart';
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
      padding: const EdgeInsets.only(
        left: kDefaultElementSpacing,
        top: kDefaultElementSpacing * 1.5,
        right: kDefaultElementSpacing,
        bottom: kDefaultElementSpacing * 2.0,
      ),
      decoration: const BoxDecoration(
          color: kDarkBackgroundColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40.0),
          )),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: kMainMaxWidth,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
              const CountersCard(),
              const SizedBox(
                height: kDefaultElementSpacing * 2.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Button(
                      'Projets',
                      icon: Icons.inventory_2,
                      onTap: () {
                        Navigator.pushNamed(context, kProjectsRoute);
                      },
                      isDark: true,
                    ),
                  ),
                  const SizedBox(
                    width: kDefaultElementSpacing,
                  ),
                  Expanded(
                    child: Button(
                      'Tâches',
                      icon: Icons.checklist,
                      onTap: () {
                        Navigator.pushNamed(context, kTasksRoute);
                      },
                      isDark: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
