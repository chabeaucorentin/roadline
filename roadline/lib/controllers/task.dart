import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:roadline/models/task.dart';
import 'package:roadline/utils/loader.dart';
import 'package:roadline/utils/status_bar.dart';

class TaskController {
  TaskController(this.task) {
    if (task.date != null) {
      hasDate.value = true;
      if (task.time != null) {
        hasTime.value = true;
      }
    }
  }

  final formKey = GlobalKey<FormState>();
  final hasDate = ValueNotifier<bool>(false);
  final hasTime = ValueNotifier<bool>(false);
  Task task;

  Future<void> add(BuildContext context) async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      if (task.projectId != null) {
        try {
          Loader.showSpinner(context);

          await FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('projects')
              .doc(task.projectId)
              .collection('tasks')
              .doc()
              .set(task.getMap())
              .then((value) {
            StatusBar.showSuccessMessage(
              'Tâche créée avec succès',
            );
            Navigator.pop(context);
            Navigator.pop(context);
          });
        } on FirebaseException catch (e) {
          Navigator.pop(context);
          StatusBar.showErrorMessageCode(e.code);
        }
      } else {
        StatusBar.showErrorMessage(
            'Veuillez créer un projet avant d’ajouter une tâche');
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
            .doc(task.projectId)
            .collection('tasks')
            .doc(task.id)
            .update(task.getMap())
            .then((value) {
          StatusBar.showSuccessMessage(
            'Tâche mise à jour avec succès',
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
          .doc(task.projectId)
          .collection('tasks')
          .doc(task.id)
          .delete()
          .then((value) {
        StatusBar.showSuccessMessage(
          'Tâche supprimée avec succès',
        );
      });
    } on FirebaseException catch (e) {
      StatusBar.showErrorMessageCode(e.code);
    }
  }

  Future<void> reverseStatus(BuildContext context) async {
    try {
      task.isCompleted = !task.isCompleted;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('projects')
          .doc(task.projectId)
          .collection('tasks')
          .doc(task.id)
          .update({'isCompleted': task.isCompleted});
    } on FirebaseException catch (e) {
      StatusBar.showErrorMessageCode(e.code);
    }
  }
}
