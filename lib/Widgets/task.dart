// ignore_for_file: prefer_final_fields, unused_field
import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];
  List<Task> get tasks => _tasks.toList();

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }
}

class Task {
  String title;
  String desc;
  String? id;

  Task({
    required this.title,
    required this.desc,
    this.id,
  });
}
