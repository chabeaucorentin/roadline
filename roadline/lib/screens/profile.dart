import 'package:flutter/material.dart';
import 'package:roadline/partials/buttons/arrow_button.dart';
import 'package:roadline/partials/buttons/bottom_button.dart';
import 'package:roadline/partials/buttons/button.dart';
import 'package:roadline/partials/headers/profile_header.dart';
import 'package:roadline/routes/routes.dart';
import 'package:roadline/styles/constants.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: kBackgroundColor,
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const ProfileHeader(),
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
                            children: <Widget>[
                              const Text(
                                'Général',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: kCardTitleFontSize,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: kDefaultElementSpacing * 0.75,
                              ),
                              ArrowButton(
                                'Mes informations',
                                icon: Icons.person,
                                onTap: () {},
                              ),
                              const SizedBox(
                                height: kDefaultElementSpacing,
                              ),
                              ArrowButton(
                                'Modifier le mot de passe',
                                icon: Icons.lock,
                                onTap: () {},
                              ),
                              const SizedBox(
                                height: kDefaultElementSpacing,
                              ),
                              ArrowButton(
                                'Politique de confidentialité',
                                icon: Icons.security,
                                onTap: () {},
                              ),
                              const SizedBox(
                                height: kDefaultElementSpacing,
                              ),
                              ArrowButton(
                                'Termes et conditions',
                                icon: Icons.description,
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: kDefaultElementSpacing,
                ),
                BottomButton(
                  button: Button(
                    'Déconnexion',
                    onTap: () {
                      Navigator.pushNamed(context, kLoginRoute);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
