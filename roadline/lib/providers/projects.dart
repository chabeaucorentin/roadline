import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:roadline/models/project.dart';

class ProjectsProvider {
  Stream<List<Project>> get projectStream => _getProjectStream();

  Stream<List<Project>> get favoriteProjectStream =>
      _getFavoriteProjectStream();

  Stream<List<Project>> _getProjectStream() {
    final streamController = StreamController<List<Project>>();

    final projectChangedSubscription = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('projects')
        .orderBy('title')
        .snapshots()
        .listen((snapshot) {
      List<Project> projects = snapshot.docs.map((doc) {
        final Map<String, dynamic> data = doc.data();
        final project = Project(id: doc.id);
        if (data.containsKey('title')) {
          project.title = data['title'];
        }
        if (data.containsKey('endDate')) {
          project.endDate = data['endDate'];
        }
        if (data.containsKey('isFavorite')) {
          project.isFavorite = data['isFavorite'];
        }
        return project;
      }).toList();
      streamController.add(projects);
    });

    streamController.onCancel = () {
      projectChangedSubscription.cancel();
    };

    return streamController.stream;
  }

  Stream<List<Project>> _getFavoriteProjectStream() {
    final streamController = StreamController<List<Project>>();

    final favoriteProjectSubscription = projectStream.listen((snapshot) {
      List<Project> projects =
          snapshot.where((project) => project.isFavorite).toList();
      streamController.add(projects);
    });

    streamController.onCancel = () {
      favoriteProjectSubscription.cancel();
    };

    return streamController.stream;
  }
}
