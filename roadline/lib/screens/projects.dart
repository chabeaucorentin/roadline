import 'package:flutter/material.dart';
import 'package:roadline/cards/project_card.dart';
import 'package:roadline/partials/buttons/button.dart';
import 'package:roadline/partials/navbar/main_nav_bar.dart';
import 'package:roadline/partials/sidebar/side_bar.dart';
import 'package:roadline/routes/routes.dart';
import 'package:roadline/styles/constants.dart';

class Projects extends StatelessWidget {
  Projects({super.key});

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
          children: <Widget>[
            MainNavBar(
              mainKey: _key,
              title: 'Projets',
            ),
            Expanded(
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.0),
                  ),
                ),
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
                              'Créer un projet',
                              onTap: () {
                                Navigator.pushNamed(context, kNewProjectRoute);
                              },
                            ),
                            const SizedBox(
                              height: kDefaultElementSpacing,
                            ),
                            /*const Text(
                              'Aucun projet en favoris',
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: kBigFontSize,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),*/
                            const ProjectCard(
                              name: 'Nom du projet 1',
                              date: 'Date du projet',
                              nbCompleted: 5,
                              nbTasks: 10,
                            ),
                            const ProjectCard(
                              name: 'Nom du projet 2',
                              nbCompleted: 2,
                              nbTasks: 5,
                            ),
                            const ProjectCard(
                              name: 'Nom du projet 3',
                              date: 'Date du projet',
                              nbCompleted: 5,
                              nbTasks: 10,
                            ),
                            const ProjectCard(
                              name: 'Nom du projet 4',
                              nbCompleted: 7,
                              nbTasks: 10,
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
