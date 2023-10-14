// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Task {
  final String id;
  final String name;
  final String description;
  final bool done;
  final DateTime createdAt;

  Task({
    required this.id,
    required this.name,
    required this.description,
    required this.done,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'done': done,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      done: map['done'] as bool,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  static empty() {
    return Task(
      id: '',
      name: '',
      description: '',
      done: false,
      createdAt: DateTime.now(),
    );
  }

  copyWith() {};
}
