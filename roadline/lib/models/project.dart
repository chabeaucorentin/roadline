class Project {
  Project(
      {this.id,
        this.title = '',
        this.description,
        this.endDate,
        this.isFavorite = false});

  String? id;
  String title;
  String? description;
  String? endDate;
  int? nbCompleted;
  int? nbTasks;
  bool isFavorite;

  Map<String, dynamic> getMap() {
    final map = <String, dynamic>{
      'title': title.trim(),
    };

    if (description != null && description!.isNotEmpty) {
      map['description'] = description!;
    }
    if (endDate != null && endDate!.isNotEmpty) {
      map['endDate'] = endDate!;
    }
    if (isFavorite) {
      map['isFavorite'] = isFavorite;
    }

    return map;
  }

  @override
  String toString() {
    return '{id: $id, title: $title, description: $description, endDate: $endDate, isFavorite: $isFavorite}';
  }
}
