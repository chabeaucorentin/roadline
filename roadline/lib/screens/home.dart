import 'package:flutter/material.dart';
import 'package:roadline/cards/home_card.dart';
import 'package:roadline/cards/project_card.dart';
import 'package:roadline/partials/buttons/button.dart';
import 'package:roadline/partials/navbar/nav_bar.dart';
import 'package:roadline/routes/routes.dart';
import 'package:roadline/styles/constants.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const NavBar(),
            Expanded(
              child: Container(
                color: kBackgroundColor,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const HomeCard(),
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
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: const <Widget>[
                                Text(
                                  'Favoris',
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: kCardTitleFontSize,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: kDefaultElementSpacing * 0.75,
                                ),
                                /*Padding(
                                  padding: EdgeInsets.only(
                                    top: kDefaultElementSpacing * 0.5,
                                    bottom: kDefaultElementSpacing * 0.75,
                                  ),
                                  child: Text(
                                    'Aucun projet en favoris',
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: kBigFontSize,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),*/
                                ProjectCard(
                                  name: 'Nom du projet 1',
                                  date: 'Date du projet',
                                  nbCompleted: 2,
                                  nbTasks: 5,
                                ),
                                SizedBox(
                                  height: kDefaultElementSpacing,
                                ),
                                ProjectCard(
                                  name: 'Nom du projet 2',
                                  date: 'Date du projet',
                                  nbCompleted: 5,
                                  nbTasks: 10,
                                ),
                                SizedBox(
                                  height: kDefaultElementSpacing,
                                ),
                                ProjectCard(
                                  name: 'Nom du projet 3',
                                  date: 'Date du projet',
                                  nbCompleted: 7,
                                  nbTasks: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: kDefaultElementSpacing,
                top: kDefaultElementSpacing,
                right: kDefaultElementSpacing,
                bottom: 44.0,
              ),
              color: kBackgroundColor,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: kMainMaxWidth,
                  ),
                  child: Button(
                    "Créer un projet",
                    onTap: () {
                      Navigator.pushNamed(context, kRegisterRoute);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
