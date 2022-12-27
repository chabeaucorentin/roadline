import 'package:flutter/material.dart';
import 'package:roadline/partials/buttons/button.dart';
import 'package:roadline/partials/components/screen.dart';
import 'package:roadline/partials/forms/email_input.dart';
import 'package:roadline/partials/forms/password_input.dart';
import 'package:roadline/partials/headers/form_header.dart';
import 'package:roadline/partials/links/link.dart';
import 'package:roadline/routes/routes.dart';
import 'package:roadline/styles/constants.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Screen(
      isBottomDark: true,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Form(
            key: _loginFormKey,
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
                            const EmailInput(),
                            const SizedBox(
                              height: kDefaultElementSpacing,
                            ),
                            const PasswordInput(),
                            const SizedBox(
                              height: kDefaultElementSpacing / 3.0,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Link(
                                'Mot de passe oublié ?',
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, kResetPasswordRoute);
                                },
                                isDark: true,
                              ),
                            ),
                            const SizedBox(
                              height: kDefaultElementSpacing,
                            ),
                            Button(
                              'Connexion',
                              onTap: () {
                                Navigator.pushNamed(context, kHomeRoute);
                              },
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
                              Navigator.pushNamed(context, kRegisterRoute);
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
