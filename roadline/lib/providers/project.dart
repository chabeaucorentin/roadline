import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:roadline/models/project.dart';

@immutable
class ProjectProvider {
  const ProjectProvider({required this.id});

  final String id;

  Stream<Project> get projectStream => _getProjectStream();

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
}
