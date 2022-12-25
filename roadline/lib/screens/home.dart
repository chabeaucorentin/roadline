import 'package:flutter/material.dart';
import 'package:roadline/partials/headers/home_header.dart';
import 'package:roadline/cards/project_card.dart';
import 'package:roadline/partials/buttons/bottom_button.dart';
import 'package:roadline/partials/buttons/button.dart';
import 'package:roadline/partials/components/shadow_box.dart';
import 'package:roadline/partials/navbar/main_nav_bar.dart';
import 'package:roadline/partials/sidebar/side_bar.dart';
import 'package:roadline/routes/routes.dart';
import 'package:roadline/styles/constants.dart';

class Home extends StatelessWidget {
  Home({super.key});

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
            ),
            Expanded(
              child: ColoredBox(
                color: kBackgroundColor,
                child: Stack(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const HomeHeader(),
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
                                    ProjectCard(
                                      name: 'Nom du projet 2',
                                      date: 'Date du projet',
                                      nbCompleted: 5,
                                      nbTasks: 10,
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
                    const ShadowBox(),
                  ],
                ),
              ),
            ),
            BottomButton(
              button: Button(
                'Créer un projet',
                onTap: () {
                  Navigator.pushNamed(context, kNewProjectRoute);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
