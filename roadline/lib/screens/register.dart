import 'package:flutter/material.dart';
import 'package:roadline/controllers/user_action.dart';
import 'package:roadline/partials/buttons/button.dart';
import 'package:roadline/partials/components/screen.dart';
import 'package:roadline/partials/forms/email_input.dart';
import 'package:roadline/partials/forms/full_name_input.dart';
import 'package:roadline/partials/forms/password_input.dart';
import 'package:roadline/partials/headers/form_header.dart';
import 'package:roadline/partials/links/link.dart';
import 'package:roadline/routes/routes.dart';
import 'package:roadline/styles/constants.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final userAction = UserAction();

  @override
  Widget build(BuildContext context) {
    return Screen(
      isBottomDark: true,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Form(
            key: userAction.formKey,
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
                            FullNameInput(
                              userAction: userAction,
                            ),
                            const SizedBox(
                              height: kDefaultElementSpacing,
                            ),
                            EmailInput(
                              userAction: userAction,
                            ),
                            const SizedBox(
                              height: kDefaultElementSpacing,
                            ),
                            PasswordInput(
                              userAction: userAction,
                            ),
                            const SizedBox(
                              height: kDefaultElementSpacing,
                            ),
                            PasswordInput(
                              userAction: userAction,
                              isConfirm: true,
                            ),
                            const SizedBox(
                              height: kDefaultElementSpacing,
                            ),
                            Button(
                              'Inscription',
                              onTap:  () => userAction.register(context),
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
                            'Déjà un compte ?',
                            style: TextStyle(
                              color: kDarkLighterColor,
                              fontSize: kDefaultFontSize,
                            ),
                          ),
                          const SizedBox(
                            height: kDefaultElementSpacing / 3.0,
                          ),
                          Link(
                            'Connectez-vous',
                            onTap: () {
                              Navigator.pushNamed(context, kLoginRoute);
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
