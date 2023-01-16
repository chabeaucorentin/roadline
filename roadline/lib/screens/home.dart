import 'package:flutter/material.dart';
import 'package:roadline/cards/project_card.dart';
import 'package:roadline/models/project.dart';
import 'package:roadline/partials/buttons/button.dart';
import 'package:roadline/partials/components/bottom_widget.dart';
import 'package:roadline/partials/components/screen.dart';
import 'package:roadline/partials/components/shadow_box.dart';
import 'package:roadline/partials/headers/home_header.dart';
import 'package:roadline/partials/navbar/main_nav_bar.dart';
import 'package:roadline/partials/sidebar/side_bar.dart';
import 'package:roadline/providers/projects.dart';
import 'package:roadline/routes/routes.dart';
import 'package:roadline/styles/constants.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final projectsProvider = ProjectsProvider();

    return Screen(
      mainKey: _key,
      drawer: const Drawer(
        child: SideBar(),
      ),
      child: Column(
        children: <Widget>[
          MainNavBar(
            mainKey: _key,
          ),
          Expanded(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    'Favoris',
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: kCardTitleFontSize,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: kDefaultElementSpacing * 0.75,
                                ),
                                StreamBuilder<List<Project>>(
                                  stream: projectsProvider.favoriteProjectStream,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<List<Project>> snapshot) {
                                    if (snapshot.connectionState ==
                                            ConnectionState.active &&
                                        snapshot.hasData) {
                                      final projects = snapshot.data;
                                      if (projects != null &&
                                          projects.isNotEmpty) {
                                        return ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          padding: const EdgeInsets.only(),
                                          itemCount: projects.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            final project = projects[index];
                                            return ProjectCard(
                                              project: project,
                                            );
                                          },
                                        );
                                      }
                                    }

                                    return Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          top: kDefaultElementSpacing * 0.5,
                                          bottom: kDefaultElementSpacing * 1.75,
                                        ),
                                        child: snapshot.connectionState ==
                                                ConnectionState.waiting
                                            ? const CircularProgressIndicator()
                                            : const Text(
                                                'Aucun projet en favoris',
                                                style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontSize: kBigFontSize,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                      ),
                                    );
                                  },
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
          BottomWidget(
            child: Button(
              'Créer un projet',
              onTap: () {
                Navigator.pushNamed(context, kNewProjectRoute);
              },
            ),
          ),
        ],
      ),
    );
  }
}
