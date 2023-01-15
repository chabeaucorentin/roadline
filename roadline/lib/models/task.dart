import 'package:flutter/cupertino.dart';

@immutable
class Task {
  const Task(
      {required this.id,
      this.name = "Tâche",
      this.notes,
      this.date,
      this.time,
      this.isCompleted = false});

  final String id;
  final String name;
  final String? notes;
  final String? date;
  final String? time;
  final bool isCompleted;

  @override
  String toString() {
    return '{id: $id, name: $name, notes: $notes, date: $date, time: $time, isCompleted: $isCompleted}';
  }
}
