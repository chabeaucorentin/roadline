import 'package:flutter/material.dart';
import 'package:roadline/partials/buttons/button.dart';
import 'package:roadline/partials/forms/email_input.dart';
import 'package:roadline/partials/forms/fullname_input.dart';
import 'package:roadline/partials/forms/password_input.dart';
import 'package:roadline/partials/headers/form_header.dart';
import 'package:roadline/partials/links/link.dart';
import 'package:roadline/routes/routes.dart';
import 'package:roadline/styles/constants.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final _registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackgroundColor,
      body: SafeArea(
        child: Form(
          key: _registerFormKey,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultElementSpacing,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const FormHeader(),
                    Column(
                      children: <Widget>[
                        const FullNameInput(),
                        const SizedBox(
                          height: kDefaultElementSpacing,
                        ),
                        const EmailInput(),
                        const SizedBox(
                          height: kDefaultElementSpacing,
                        ),
                        const PasswordInput(),
                        const SizedBox(
                          height: kDefaultElementSpacing,
                        ),
                        const PasswordInput(
                            hintText: 'Confirmez le mot de passe'),
                        const SizedBox(
                          height: kDefaultElementSpacing,
                        ),
                        Button(
                          'Inscription',
                          onTap: () {
                            Navigator.pushNamed(context, kHomeRoute);
                          },
                          isDark: true,
                        ),
                      ],
                    ),
                    Container(
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
          ),
        ),
      ),
    );
  }
}
