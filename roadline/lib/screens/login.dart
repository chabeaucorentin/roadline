import 'package:flutter/material.dart';
import 'package:roadline/controllers/user_action.dart';
import 'package:roadline/partials/buttons/button.dart';
import 'package:roadline/partials/components/screen.dart';
import 'package:roadline/partials/forms/email_input.dart';
import 'package:roadline/partials/forms/password_input.dart';
import 'package:roadline/partials/headers/form_header.dart';
import 'package:roadline/partials/links/link.dart';
import 'package:roadline/routes/routes.dart';
import 'package:roadline/styles/constants.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userActionController = UserActionController();

    return Screen(
      isBottomDark: true,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Form(
            key: userActionController.formKey,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultElementSpacing,
                ),
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const FormHeader(),
                    Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: kDefaultCardMaxWidth,
                        ),
                        child: Column(
                          children: <Widget>[
                            EmailInput(
                              userActionController: userActionController,
                            ),
                            const SizedBox(
                              height: kDefaultElementSpacing,
                            ),
                            PasswordInput(
                              userActionController: userActionController,
                            ),
                            const SizedBox(
                              height: kDefaultElementSpacing / 3.0,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Link(
                                'Mot de passe oublié ?',
                                onTap: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      kResetPasswordRoute,
                                      (Route route) => false);
                                },
                                isDark: true,
                              ),
                            ),
                            const SizedBox(
                              height: kDefaultElementSpacing,
                            ),
                            Button(
                              'Connexion',
                              onTap: () => userActionController.login(context),
                              isDark: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 75.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Pas encore de compte ?',
                            style: TextStyle(
                              color: kDarkLighterColor,
                              fontSize: kDefaultFontSize,
                            ),
                          ),
                          const SizedBox(
                            height: kDefaultElementSpacing / 3.0,
                          ),
                          Link(
                            'Inscrivez-vous',
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  kRegisterRoute, (Route route) => false);
                            },
                            isBig: true,
                            isDark: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
