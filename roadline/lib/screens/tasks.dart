import 'package:flutter/material.dart';
import 'package:roadline/cards/task_card.dart';
import 'package:roadline/partials/buttons/button.dart';
import 'package:roadline/partials/components/bottom_widget.dart';
import 'package:roadline/partials/components/screen.dart';
import 'package:roadline/partials/components/shadow_box.dart';
import 'package:roadline/partials/navbar/main_nav_bar.dart';
import 'package:roadline/partials/sidebar/side_bar.dart';
import 'package:roadline/partials/tabbar/tasks_tab_bar.dart';
import 'package:roadline/routes/routes.dart';
import 'package:roadline/styles/constants.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({super.key});

  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Screen(
      mainKey: _key,
      drawer: const Drawer(
        child: SideBar(),
      ),
      child: Column(
        children: <Widget>[
          MainNavBar(
            mainKey: _key,
            title: 'Tâches',
          ),
          const TasksTabBar(),
          Expanded(
            child: ColoredBox(
              color: kDarkBackgroundColor,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.0),
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: kDefaultElementSpacing,
                          top: kDefaultElementSpacing,
                          right: kDefaultElementSpacing,
                        ),
                        child: Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: kMainMaxWidth,
                            ),
                            child: Column(
                              children: const <Widget>[
                                /*const Text(
                                  'Aucune tâche',
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: kBigFontSize,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),*/
                                /*TaskCard(
                                  completed: false,
                                  name: 'Tâche 1',
                                ),
                                TaskCard(
                                  completed: true,
                                  name: 'Tâche 2',
                                  date: 'Date et heure',
                                ),
                                TaskCard(
                                  completed: false,
                                  projectName: 'Nom du projet',
                                  name: 'Tâche 3',
                                ),
                                TaskCard(
                                  completed: true,
                                  projectName: 'Nom du projet',
                                  name: 'Tâche 4',
                                  date: 'Date et heure',
                                ),*/
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const ShadowBox(),
                  ],
                ),
              ),
            ),
          ),
          BottomWidget(
            child: Button(
              'Ajouter une tâche',
              onTap: () {
                Navigator.pushNamed(context, kAddTaskRoute);
              },
            ),
          ),
        ],
      ),
    );
  }
}
