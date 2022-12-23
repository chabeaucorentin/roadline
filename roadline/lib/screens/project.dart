import 'package:flutter/material.dart';
import 'package:roadline/cards/task_card.dart';
import 'package:roadline/partials/buttons/bottom_button.dart';
import 'package:roadline/partials/buttons/button.dart';
import 'package:roadline/partials/components/shadow_box.dart';
import 'package:roadline/partials/headers/project_header.dart';
import 'package:roadline/routes/routes.dart';
import 'package:roadline/styles/constants.dart';

class Project extends StatelessWidget {
  Project({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                color: kBackgroundColor,
                child: Stack(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const ProjectHeader(),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: kDefaultElementSpacing,
                              top: kDefaultElementSpacing * 1.5,
                              right: kDefaultElementSpacing,
                            ),
                            child: Center(
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxWidth: kMainMaxWidth,
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: const <Widget>[
                                    Text(
                                      'Tâches',
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: kCardTitleFontSize,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                      height: kDefaultElementSpacing * 0.75,
                                    ),
                                    TaskCard(
                                      completed: true,
                                      name: 'Tâche 1',
                                      date: 'Date et heure',
                                    ),
                                    TaskCard(
                                      completed: true,
                                      name: 'Tâche 2',
                                      date: 'Date et heure',
                                    ),
                                    TaskCard(
                                      completed: true,
                                      name: 'Tâche 3',
                                      date: 'Date et heure',
                                    ),
                                    TaskCard(
                                      completed: true,
                                      name: 'Tâche 4',
                                      date: 'Date et heure',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const ShadowBox(),
                  ],
                ),
              ),
            ),
            BottomButton(
              button: Button(
                'Ajouter une tâche',
                onTap: () {
                  Navigator.pushNamed(context, kAddTaskRoute);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
