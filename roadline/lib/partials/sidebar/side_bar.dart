import 'package:flutter/material.dart';
import 'package:roadline/partials/buttons/side_bar_button.dart';
import 'package:roadline/partials/logos/logo.dart';
import 'package:roadline/routes/routes.dart';
import 'package:roadline/styles/constants.dart';

@immutable
class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kDarkBackgroundColor,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: kSpacingPadding + 2.5,
                horizontal: kDefaultElementSpacing,
              ),
              child: Logo(),
            ),
            Expanded(
              child: Container(
                color: kBackgroundColor,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: kDefaultElementSpacing,
                        ),
                        child: Column(
                          children: const <Widget>[
                            SideBarButton(
                              icon: Icons.home,
                              label: 'Accueil',
                              route: kHomeRoute,
                            ),
                            SideBarButton(
                              icon: Icons.inventory_2,
                              label: 'Projets',
                              counter: 8,
                              route: kProjectsRoute,
                            ),
                            SideBarButton(
                              icon: Icons.checklist,
                              label: 'Tâches',
                              counter: 40,
                              route: kTasksRoute,
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 1.5,
                        thickness: 1.5,
                        color: kSideBarSeparatorColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: kDefaultElementSpacing,
                        ),
                        child: Column(
                          children: const <Widget>[
                            SideBarButton(
                              icon: Icons.info,
                              label: 'À propos',
                              route: kLoginRoute,
                            ),
                            SideBarButton(
                              icon: Icons.copyright,
                              label: 'Crédits',
                              route: kLoginRoute,
                            ),
                            SideBarButton(
                              icon: Icons.settings,
                              label: 'Paramètres',
                              route: kLoginRoute,
                            ),
                          ],
                        ),
                      ),
                    ],
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
