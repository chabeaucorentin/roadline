class Task {
  Task(
      {this.id,
      this.projectId,
      this.title = '',
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

  Map<String, dynamic> getMap() {
    final map = <String, dynamic>{
      'title': title.trim(),
    };

    if (notes != null && notes!.isNotEmpty) {
      map['notes'] = notes!;
    }
    if (date != null && date!.isNotEmpty) {
      map['date'] = date!;
    }
    if (time != null && time!.isNotEmpty) {
      map['time'] = time!;
    }
    if (isCompleted) {
      map['isCompleted'] = isCompleted;
    }

    return map;
  }

  @override
  String toString() {
    return '{id: $id, projectId: $projectId, name: $title, notes: $notes, date: $date, time: $time, isCompleted: $isCompleted}';
  }
}
