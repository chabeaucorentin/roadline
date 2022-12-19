import 'package:flutter/material.dart';
import 'package:roadline/cards/task_card.dart';
import 'package:roadline/partials/buttons/button.dart';
import 'package:roadline/partials/navbar/main_nav_bar.dart';
import 'package:roadline/partials/sidebar/side_bar.dart';
import 'package:roadline/partials/tabbar/tasks_tab_bar.dart';
import 'package:roadline/routes/routes.dart';
import 'package:roadline/styles/constants.dart';

class Tasks extends StatelessWidget {
  Tasks({super.key});

  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: const Drawer(
        child: SideBar(),
      ),
      backgroundColor: kDarkBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            MainNavBar(
              mainKey: _key,
              title: 'Tâches',
            ),
            const TasksTabBar(),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20.0),
                    )),
                child: SingleChildScrollView(
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
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Button(
                              'Ajouter une tâche',
                              onTap: () {
                                Navigator.pushNamed(context, kRegisterRoute);
                              },
                            ),
                            const SizedBox(
                              height: kDefaultElementSpacing,
                            ),
                            /*const Text(
                              'Aucune tâche',
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: kBigFontSize,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),*/
                            const TaskCard(
                              completed: false,
                              name: 'Tâche 1',
                            ),
                            const TaskCard(
                              completed: true,
                              name: 'Tâche 2',
                              date: 'Date et heure',
                            ),
                            const TaskCard(
                              completed: false,
                              projectName: 'Nom du projet',
                              name: 'Tâche 3',
                            ),
                            const TaskCard(
                              completed: true,
                              projectName: 'Nom du projet',
                              name: 'Tâche 4',
                              date: 'Date et heure',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}