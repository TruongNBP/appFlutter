// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TodoModel {
  final String title;
  final String description;
  final DateTime date;
  final bool isDone;
  final bool isArchived;

  TodoModel({
    required this.title,
    required this.description,
    required this.date,
    required this.isDone,
    required this.isArchived,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'date': date.millisecondsSinceEpoch,
      'isDone': isDone,
      'isArchived': isArchived,
    };
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      title: json['title'] as String,
      description: json['description'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(json['date'] as int),
      isDone: json['isDone'] as bool,
      isArchived: json['isArchived'] as bool,
    );
  }
}
