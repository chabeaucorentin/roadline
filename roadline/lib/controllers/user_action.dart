import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:roadline/providers/user_infos.dart';
import 'package:roadline/routes/routes.dart';
import 'package:roadline/utils/loader.dart';
import 'package:roadline/utils/status_bar.dart';

class UserActionController {
  UserActionController({this.fullName, this.email, this.password, this.confirmPassword});

  final formKey = GlobalKey<FormState>();
  String? fullName;
  String? email;
  String? password;
  String? confirmPassword;
  final userInfosProvider = UserInfosProvider();

  Future<void> login(BuildContext context) async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      try {
        Loader.showSpinner(context);

        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: email!.trim(),
          password: password!.trim(),
        )
            .then((value) async {
          await userInfosProvider.fullNameStream.first.then((name) {
            StatusBar.showSuccessMessage(
              'Bonjour, ${name.isNotEmpty ? name : value.user!.email}',
            );
          });
        });
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        StatusBar.showErrorMessage(e.code);
      }
    }
  }

  Future<void> register(BuildContext context) async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      try {
        Loader.showSpinner(context);

        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: email!.trim(),
          password: password!.trim(),
        )
            .then((value) async {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(value.user!.uid)
              .set({
            'fullName': fullName!.trim(),
          });
          await userInfosProvider.fullNameStream.first.then((name) {
            StatusBar.showSuccessMessage(
              'Bienvenue, ${name.isNotEmpty ? name : value.user!.email}',
            );
          });
        });
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        StatusBar.showErrorMessage(e.code);
      }
    }
  }

  Future<void> resetPassword(BuildContext context) async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      try {
        Loader.showSpinner(context);

        await FirebaseAuth.instance
            .sendPasswordResetEmail(
          email: email!.trim(),
        )
            .then((value) {
          StatusBar.showSuccessMessage(
            'Un email a bien été envoyé à l’adresse email ${email!.trim()}',
          );
          Navigator.pushNamed(context, kLoginRoute);
        });
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        StatusBar.showErrorMessage(e.code);
      }
    }
  }

  static Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut().then((value) {
        StatusBar.showSuccessMessage(
          'Vous avez été déconnecté',
        );
      });
    } on FirebaseAuthException catch (e) {
      StatusBar.showErrorMessage(e.code);
    }
  }
}
