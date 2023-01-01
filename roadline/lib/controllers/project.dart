import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:roadline/routes/routes.dart';
import 'package:roadline/utils/loader.dart';
import 'package:roadline/utils/status_bar.dart';

class ProjectController {
  ProjectController({this.title, this.description, this.date});

  final formKey = GlobalKey<FormState>();
  final hasDate = ValueNotifier<bool>(true);
  String? title;
  String? description;
  String? date;

  Future<void> create(BuildContext context) async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      try {
        Loader.showSpinner(context);

        final map = {
          'title': title!.trim(),
        };

        if (description != null && description!.isNotEmpty) {
          map['description'] = description!;
        }
        if (date != null && date!.isNotEmpty) {
          map['date'] = date!;
        }

        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('projects')
            .doc()
            .set(map)
            .then((value) {
          StatusBar.showSuccessMessage(
            'Projet créé avec succès',
          );
          Navigator.pushNamed(context, kProjectsRoute);
        });
      } on FirebaseException catch (e) {
        Navigator.pop(context);
        StatusBar.showErrorMessage(e.code);
      }
    }
  }
}
