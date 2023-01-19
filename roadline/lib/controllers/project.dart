import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:roadline/models/project.dart';
import 'package:roadline/screens/project.dart';
import 'package:roadline/utils/loader.dart';
import 'package:roadline/utils/status_bar.dart';

class ProjectController {
  ProjectController(this.project) {
    if (project.endDate != null) {
      hasDate.value = true;
    }
  }

  final formKey = GlobalKey<FormState>();
  final hasDate = ValueNotifier<bool>(false);
  Project project;

  Future<void> create(BuildContext context) async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      try {
        Loader.showSpinner(context);

        final docRef = FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('projects')
            .doc();
        project.id = docRef.id;
        await docRef.set(project.getMap()).then((value) {
          StatusBar.showSuccessMessage(
            'Projet créé avec succès',
          );
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProjectScreen(
                project: project,
              ),
            ),
          );
        });
      } on FirebaseException catch (e) {
        Navigator.pop(context);
        StatusBar.showErrorMessageCode(e.code);
      }
    }
  }

  Future<void> update(BuildContext context) async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      try {
        Loader.showSpinner(context);

        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('projects')
            .doc(project.id)
            .update(project.getMap())
            .then((value) {
          StatusBar.showSuccessMessage(
            'Projet mis à jour avec succès',
          );
          Navigator.pop(context);
          Navigator.pop(context);
        });
      } on FirebaseException catch (e) {
        Navigator.pop(context);
        StatusBar.showErrorMessageCode(e.code);
      }
    }
  }

  Future<void> delete(BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('projects')
          .doc(project.id)
          .delete()
          .then((value) {
        StatusBar.showSuccessMessage(
          'Projet supprimé avec succès',
        );
        Navigator.pop(context);
      });
    } on FirebaseException catch (e) {
      StatusBar.showErrorMessageCode(e.code);
    }
  }

  Future<void> reverseFavorite(BuildContext context) async {
    try {
      project.isFavorite = !project.isFavorite;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('projects')
          .doc(project.id)
          .update({'isFavorite': project.isFavorite}).then((value) {
        if (project.isFavorite) {
          StatusBar.showSuccessMessage(
            'Projet ajouté aux favoris',
          );
        } else {
          StatusBar.showSuccessMessage(
            'Projet supprimé des favoris',
          );
        }
      });
    } on FirebaseException catch (e) {
      StatusBar.showErrorMessageCode(e.code);
    }
  }
}
