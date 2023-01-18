import 'dart:async';

import 'package:roadline/models/task.dart';
import 'package:roadline/providers/project.dart';
import 'package:roadline/providers/projects.dart';

class TasksProvider {
  Stream<List<Task>> get taskStream => _getTaskStream();

  Stream<List<Task>> _getTaskStream() {
    final streamController = StreamController<List<Task>>();

    final taskSubscription = ProjectsProvider().projectStream.listen((snapshot) {
      final tasks = <Task>[];
      snapshot.map((project) {
        ProjectProvider(id: project.id!).taskStream.listen((event) {
          final projectTask = event.map((task) {
            task.projectId = project.id;
            task.projectTitle = project.title;
            return task;
          });
          tasks.addAll(projectTask);
        });
      }).toList();
      streamController.add(tasks);
    });

    streamController.onCancel = () {
      taskSubscription.cancel();
    };

    return streamController.stream;
  }
}
