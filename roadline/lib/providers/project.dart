import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:roadline/models/project.dart';
import 'package:roadline/models/task.dart';
import 'package:roadline/routes/routes.dart';
import 'package:roadline/utils/status_bar.dart';

@immutable
class ProjectProvider {
  const ProjectProvider({required this.id});

  final String id;

  Stream<Project> getProjectStream(BuildContext context) => _getProjectStream(context);

  Stream<List<Task>> get taskStream => _getTaskStream();

  Stream<int> get taskCounterStream => _getTaskCounterStream();

  Stream<int> get taskCompletedCounterStream => _getTaskCompletedCounterStream();

  Stream<Project> _getProjectStream(BuildContext context) {
    final streamController = StreamController<Project>();

    final projectChangedSubscription = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('projects')
        .doc(id)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.exists) {
        final project = Project(
          id: id,
        );
        if (snapshot.data()!.containsKey('title')) {
          project.title = snapshot['title'];
        }
        if (snapshot.data()!.containsKey('description')) {
          project.description = snapshot['description'];
        }
        if (snapshot.data()!.containsKey('endDate')) {
          project.endDate = snapshot['endDate'];
        }
        if (snapshot.data()!.containsKey('isFavorite')) {
          project.isFavorite = snapshot['isFavorite'];
        }
        streamController.add(project);
      } else {
        StatusBar.showErrorMessage('Le projet a été supprimé');
        streamController.close();
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      }
    });

    streamController.onCancel = () {
      projectChangedSubscription.cancel();
    };

    return streamController.stream;
  }

  Stream<List<Task>> _getTaskStream() {
    final streamController = StreamController<List<Task>>();

    final taskChangedSubscription = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('projects')
        .doc(id)
        .collection('tasks')
        .orderBy('title')
        .snapshots()
        .listen((snapshot) {
      List<Task> tasks = snapshot.docs.map((doc) {
        final Map<String, dynamic> data = doc.data();
        final task = Task(
          id: doc.id,
          projectId: id,
        );
        if (data.containsKey('title')) {
          task.title = data['title'];
        }
        if (data.containsKey('notes')) {
          task.notes = data['notes'];
        }
        if (data.containsKey('date')) {
          task.date = data['date'];
        }
        if (data.containsKey('time')) {
          task.time = data['time'];
        }
        if (data.containsKey('isCompleted')) {
          task.isCompleted = data['isCompleted'];
        }
        return task;
      }).toList();
      streamController.add(tasks);
    });

    streamController.onCancel = () {
      taskChangedSubscription.cancel();
    };

    return streamController.stream;
  }

  Stream<int> _getTaskCounterStream() {
    final streamController = StreamController<int>();

    final taskCounterSubscription = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('projects')
        .doc(id)
        .collection('tasks')
        .snapshots()
        .listen((snapshot) {
      streamController.add(snapshot.size);
    });

    streamController.onCancel = () {
      taskCounterSubscription.cancel();
    };

    return streamController.stream;
  }

  Stream<int> _getTaskCompletedCounterStream() {
    final streamController = StreamController<int>();

    final taskCounterSubscription = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('projects')
        .doc(id)
        .collection('tasks')
        .where('isCompleted', isEqualTo: true)
        .snapshots()
        .listen((snapshot) {
      streamController.add(snapshot.size);
    });

    streamController.onCancel = () {
      taskCounterSubscription.cancel();
    };

    return streamController.stream;
  }
}
