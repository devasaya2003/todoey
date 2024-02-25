import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todoey/models/task.dart';

class TaskList extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Todoey', description: "Welcome to Todoey", isDone: false),
    Task(
        name: 'Features',
        description:
            "-Create task using the (+) button\n-Mark done using the box on the left\n-Long press to delete.",
        isDone: false),
    Task(
        name: 'Thankyou',
        description:
            "Thankyou for using my app. Hope it helps you to be more efficient.",
        isDone: false),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  UnmodifiableListView<Task> get completedTasks {
    return UnmodifiableListView(_tasks.where((task) => task.isDone));
  }

  UnmodifiableListView<Task> get incompleteTasks {
    return UnmodifiableListView(_tasks.where((task) => !task.isDone));
  }

  void addTask(String newTaskTitle, String newTaskDescription) {
    final task = Task(name: newTaskTitle, description: newTaskDescription);
    _tasks.add(task);
    notifyListeners();
  }

  int get taskCount {
    return _tasks.length;
  }

  int get completedTaskCount {
    return _tasks.where((task) => task.isDone).length;
  }

  int get incompleteTaskCount {
    return _tasks.where((task) => !task.isDone).length;
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  final _myBox = Hive.box('TODOEY');

  void loadDatabase() {
    List<dynamic> taskList = _myBox.get('tasks', defaultValue: [
    {
      'name': 'Todoey',
      'description': "Welcome to Todoey",
      'isDone': false,
    },
    {
      'name': 'Features',
      'description':
          "-Create task using the (+) button\n-Mark done using the box on the left\n-Long press to delete.",
      'isDone': false,
    },
    {
      'name': 'Thankyou',
      'description':
          "Thankyou for using my app. Hope it helps you to be more efficient.",
      'isDone': false,
    },
  ] );
    _tasks = taskList
        .map((item) => Task(
            name: item['name'],
            description: item['description'],
            isDone: item['isDone']))
        .toList();
    notifyListeners();
  }

  void saveDatabase() {
    List<Map<String, dynamic>> taskList = _tasks
        .map((task) => {
              'name': task.name,
              'description': task.description,
              'isDone': task.isDone
            })
        .toList();
    _myBox.put('tasks', taskList);
    notifyListeners();
  }
}
