import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:roadline/models/task.dart';

class TasksProvider {
  Stream<List<Task>> get taskStream => _getTaskStream();

  Stream<int> get taskCounterStream => _getTaskCounterStream();

  Stream<int> get taskProgressCounterStream => _getTaskProgressCounterStream();

  Stream<int> get taskCompletedCounterStream =>
      _getTaskCompletedCounterStream();

  Stream<List<Task>> _getTaskStream() {
    final streamController = StreamController<List<Task>>();

    final taskChangedSubscription = FirebaseFirestore.instance
        .collectionGroup('tasks')
        .snapshots()
        .listen((snapshot) async {
      final tasks = <Task>[];
      for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
        String userId = doc.reference.parent.parent!.parent.parent!.id;
        String projectId = doc.reference.parent.parent!.id;
        final project = await doc.reference.parent.parent!.get();
        Map<String, dynamic>? projectData = project.data();
        if (projectData != null &&
            userId == FirebaseAuth.instance.currentUser!.uid) {
          final Map<String, dynamic> data = doc.data();
          final task = Task(
            id: doc.id,
            projectId: projectId,
            projectTitle: projectData['title'],
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
          tasks.add(task);
        }
      }
      streamController.add(tasks);
    });

    streamController.onCancel = () {
      taskChangedSubscription.cancel();
    };

    return streamController.stream;
  }

  Stream<int> _getTaskCounterStream() {
    final streamController = StreamController<int>();

    final taskChangedSubscription = FirebaseFirestore.instance
        .collectionGroup('tasks')
        .snapshots()
        .listen((snapshot) async {
      int counter = 0;
      for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
        String userId = doc.reference.parent.parent!.parent.parent!.id;
        final project = await doc.reference.parent.parent!.get();
        Map<String, dynamic>? projectData = project.data();
        if (projectData != null &&
            userId == FirebaseAuth.instance.currentUser!.uid) {
          counter++;
        }
      }
      streamController.add(counter);
    });

    streamController.onCancel = () {
      taskChangedSubscription.cancel();
    };

    return streamController.stream;
  }

  Stream<int> _getTaskProgressCounterStream() {
    final streamController = StreamController<int>();

    final taskCounterSubscription = FirebaseFirestore.instance
        .collectionGroup('tasks')
        .snapshots()
        .listen((snapshot) async {
      int counter = 0;
      for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
        String userId = doc.reference.parent.parent!.parent.parent!.id;
        final project = await doc.reference.parent.parent!.get();
        Map<String, dynamic>? projectData = project.data();
        Map<String, dynamic> data = doc.data();
        if (projectData != null &&
            userId == FirebaseAuth.instance.currentUser!.uid &&
            (!data.containsKey('isCompleted') ||
                data.containsKey('isCompleted') && !data['isCompleted'])) {
          counter++;
        }
      }
      streamController.add(counter);
    });

    streamController.onCancel = () {
      taskCounterSubscription.cancel();
    };

    return streamController.stream;
  }

  Stream<int> _getTaskCompletedCounterStream() {
    final streamController = StreamController<int>();

    final taskCounterSubscription = FirebaseFirestore.instance
        .collectionGroup('tasks')
        .where('isCompleted', isEqualTo: true)
        .snapshots()
        .listen((snapshot) async {
      int counter = 0;
      for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
        String userId = doc.reference.parent.parent!.parent.parent!.id;
        final project = await doc.reference.parent.parent!.get();
        Map<String, dynamic>? projectData = project.data();
        Map<String, dynamic> data = doc.data();
        if (projectData != null &&
            userId == FirebaseAuth.instance.currentUser!.uid &&
            data.containsKey('isCompleted') &&
            data['isCompleted']) {
          counter++;
        }
      }
      streamController.add(counter);
    });

    streamController.onCancel = () {
      taskCounterSubscription.cancel();
    };

    return streamController.stream;
  }
}
