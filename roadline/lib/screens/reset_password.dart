import 'package:flutter/material.dart';
import 'package:roadline/controllers/user_action.dart';
import 'package:roadline/partials/buttons/bordered_button.dart';
import 'package:roadline/partials/buttons/button.dart';
import 'package:roadline/partials/components/bottom_padding.dart';
import 'package:roadline/partials/components/screen.dart';
import 'package:roadline/partials/forms/email_input.dart';
import 'package:roadline/partials/headers/form_header.dart';
import 'package:roadline/routes/routes.dart';
import 'package:roadline/styles/constants.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final userActionController = UserActionController();

  @override
  Widget build(BuildContext context) {
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
                            Button(
                              'Envoyer le code',
                              onTap: () =>
                                  userActionController.resetPassword(context),
                              isDark: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Center(
                          child: Container(
                            padding: const EdgeInsets.only(
                              top: 75.0,
                              bottom: kDefaultElementSpacing,
                            ),
                            constraints: const BoxConstraints(
                              maxWidth: kDefaultCardMaxWidth,
                            ),
                            child: BorderedButton(
                              'Retour à la connexion',
                              onTap: () {
                                Navigator.pushNamedAndRemoveUntil(context,
                                    kLoginRoute, (Route route) => false);
                              },
                              isDark: true,
                            ),
                          ),
                        ),
                        const BottomPadding(),
                      ],
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
