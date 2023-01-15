import 'package:flutter/cupertino.dart';

@immutable
class Project {
  const Project(
      {required this.id,
      required this.title,
      this.description,
      this.endDate,
      required this.isFavorite});

  final String id;
  final String title;
  final String? description;
  final String? endDate;
  final bool isFavorite;

  @override
  String toString() {
    return '{id: $id, name: $title, description: $description, date: $endDate, isFavorite: $isFavorite}';
  }
}
