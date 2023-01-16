class Project {
  Project(
      {this.id,
        this.title = 'Projet',
        this.description,
        this.endDate,
        this.isFavorite = false});

  String? id;
  String title;
  String? description;
  String? endDate;
  bool isFavorite;

  Map<String, dynamic> getMap() {
    final map = <String, dynamic>{
      'title': title.trim(),
    };

    if (description != null && description!.isNotEmpty) {
      map['description'] = description!;
    }
    if (endDate != null && endDate!.isNotEmpty) {
      map['date'] = endDate!;
    }
    if (isFavorite) {
      map['isFavorite'] = isFavorite;
    }

    return map;
  }

  @override
  String toString() {
    return '{id: $id, name: $title, notes: $description, date: $endDate, isCompleted: $isFavorite}';
  }
}
