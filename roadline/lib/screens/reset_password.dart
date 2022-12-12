import 'package:flutter/material.dart';
import 'package:roadline/partials/buttons/bordered_button.dart';
import 'package:roadline/partials/buttons/button.dart';
import 'package:roadline/partials/forms/email_input.dart';
import 'package:roadline/partials/headers/form_header.dart';
import 'package:roadline/routes/routes.dart';
import 'package:roadline/styles/constants.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

  final _resetFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackgroundColor,
      body: SafeArea(
        child: Form(
          key: _resetFormKey,
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
                        const EmailInput(),
                        const SizedBox(
                          height: kDefaultElementSpacing,
                        ),
                        Button(
                          'Envoyer le code',
                          onTap: () {
                            Navigator.pushNamed(context, kHomeRoute);
                          },
                          isDark: true,
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        top: 75.0,
                        bottom: 44.0,
                      ),
                      child: BorderedButton(
                        'Retour à la connexion',
                        onTap: () {
                          Navigator.pushNamed(context, kLoginRoute);
                        },
                        isDark: true,
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
