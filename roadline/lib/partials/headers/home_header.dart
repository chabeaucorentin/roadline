import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:roadline/cards/counters_card.dart';
import 'package:roadline/controllers/user_infos.dart';
import 'package:roadline/partials/buttons/button.dart';
import 'package:roadline/routes/routes.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  final StreamController<String> _streamController = StreamController<String>();
  String _currentDate = '';

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('fr_FR');
    Timer.periodic(const Duration(seconds: 1), (timer) {
      String newDate = DateFormat('EEEE, d MMMM y', Platform.localeName).format(DateTime.now());
      newDate = newDate[0].toUpperCase() + newDate.substring(1);
      if (_currentDate != newDate) {
        _currentDate = newDate;
        _streamController.add(_currentDate);
      }
    });
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userInfosProvider = UserInfosProvider();

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
                stream: _streamController.stream,
                builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
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
