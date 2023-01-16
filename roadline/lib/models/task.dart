class Task {
  Task(
      {this.id,
      this.projectId,
      this.title = 'Tâche',
      this.notes,
      this.date,
      this.time,
      this.isCompleted = false});

  String? id;
  String? projectId;
  String title;
  String? notes;
  String? date;
  String? time;
  bool isCompleted;

  @override
  String toString() {
    return '{id: $id, projectId: $projectId, name: $title, notes: $notes, date: $date, time: $time, isCompleted: $isCompleted}';
  }
}
