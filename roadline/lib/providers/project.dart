import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:roadline/models/project.dart';
import 'package:roadline/models/task.dart';

@immutable
class ProjectProvider {
  const ProjectProvider({required this.id});

  final String id;

  Stream<Project> get projectStream => _getProjectStream();

  Stream<List<Task>> get taskStream => _getTaskStream();

  Stream<Project> _getProjectStream() {
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
        if (snapshot.data()!.containsKey('isFavorite')) {
          project.isFavorite = snapshot['isFavorite'];
        }
        streamController.add(project);
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
          task.date = data['time'];
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
}
