import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:roadline/cards/project_card.dart';
import 'package:roadline/partials/buttons/button.dart';
import 'package:roadline/partials/components/bottom_widget.dart';
import 'package:roadline/partials/components/screen.dart';
import 'package:roadline/partials/components/shadow_box.dart';
import 'package:roadline/partials/navbar/main_nav_bar.dart';
import 'package:roadline/partials/sidebar/side_bar.dart';
import 'package:roadline/routes/routes.dart';
import 'package:roadline/styles/constants.dart';

class Projects extends StatelessWidget {
  Projects({super.key});

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
            title: 'Projets',
          ),
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
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .collection('projects')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          final projects = snapshot.data!.docs;
                          if (projects.isNotEmpty) {
                            return ListView.builder(
                              padding: const EdgeInsets.only(
                                left: kDefaultElementSpacing,
                                top: kDefaultElementSpacing,
                                right: kDefaultElementSpacing,
                              ),
                              itemCount: projects.length,
                              itemBuilder: (BuildContext context, int index) {
                                final project = projects[index].data()
                                    as Map<String, dynamic>;
                                return ProjectCard(
                                  name: project.containsKey('title')
                                      ? project['title']
                                      : 'Projet',
                                  date: project.containsKey('endDate')
                                      ? project['endDate']
                                      : null,
                                  nbCompleted: 5,
                                  nbTasks: 10,
                                );
                              },
                            );
                          }
                        }

                        return const Center(
                          child: Text(
                            'Aucun projet',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: kBigFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      },
                    ),
                    const ShadowBox(),
                  ],
                ),
              ),
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
