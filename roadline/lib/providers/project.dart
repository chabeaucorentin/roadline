import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:roadline/models/project.dart';

@immutable
class ProjectProvider {
  const ProjectProvider({required this.id});

  final String id;

  StreamController<Project> get projectStreamController =>
      _getProjectStreamController();

  Stream<Project> get projectStream => projectStreamController.stream;

  StreamController<Project> _getProjectStreamController() {
    final streamController = StreamController<Project>();

    final projectChangedSubscription = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('projects')
        .doc(id)
        .snapshots()
        .listen((snapshot) {
      final project = Project(
        id: id,
      );
      if (snapshot.exists) {
        if (snapshot.data()!.containsKey('title')) {
          project.title = snapshot['title'];
        }
        if (snapshot.data()!.containsKey('isFavorite')) {
          project.isFavorite = snapshot['isFavorite'];
        }
      }
      streamController.add(project);
    });

    streamController.onCancel = () {
      projectChangedSubscription.cancel();
    };

    return streamController;
  }
}
