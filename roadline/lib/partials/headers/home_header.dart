import 'package:flutter/material.dart';
import 'package:roadline/cards/counters_card.dart';
import 'package:roadline/partials/buttons/button.dart';
import 'package:roadline/providers/date_time.dart';
import 'package:roadline/providers/user_infos.dart';
import 'package:roadline/routes/routes.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final userInfosProvider = UserInfosProvider();
    final dateTimeProvider = DateTimeProvider();

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
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: kMainMaxWidth,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              StreamBuilder<String>(
                stream: userInfosProvider.fullNameStream,
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  return Text(
                    'Bonjour, ${snapshot.hasData ? snapshot.data! : ''}'.trim(),
                    style: const TextStyle(
                      color: kDarkPrimaryColor,
                      fontSize: kCardTitleFontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: kDefaultElementSpacing / 2.0,
              ),
              StreamBuilder<String>(
                stream: dateTimeProvider.dateStream,
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  return Text(
                    snapshot.hasData ? snapshot.data! : 'Chargement...',
                    style: const TextStyle(
                      color: kDarkCaptionColor,
                      fontSize: kDefaultFontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                },
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
                        Navigator.pushNamedAndRemoveUntil(
                            context, kProjectsRoute, (Route route) => false);
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
                        Navigator.pushNamedAndRemoveUntil(
                            context, kTasksRoute, (Route route) => false);
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
