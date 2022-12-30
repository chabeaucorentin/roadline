import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:roadline/utils/loader.dart';
import 'package:roadline/utils/status_bar.dart';

class UserAction {
  UserAction({this.fullName, this.email, this.password});

  final formKey = GlobalKey<FormState>();
  String? fullName;
  String? email;
  String? password;

  Future<void> login(BuildContext context) async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      try {
        Loader.showSpinner(context);

        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: email!,
          password: password!,
        )
            .then((value) {
          StatusBar.showSuccessMessage(
              'Bonjour ${FirebaseAuth.instance.currentUser!.email}');
        });
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        StatusBar.showErrorMessage(e.code);
      }
    }
  }

  static Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut()
          .then((value) {
        StatusBar.showSuccessMessage(
            'Vous avez été déconnecté');
      });
    } on FirebaseAuthException catch (e) {
      StatusBar.showErrorMessage(e.code);
    }
  }
}
