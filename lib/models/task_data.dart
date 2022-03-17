import 'package:flutter/foundation.dart';
import 'task.dart';
import 'package:collection/collection.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(title: 'shopping'),
    Task(title: 'go to the gym'),
    Task(title: 'todoey app', state: true),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void updateTasksList(String taskTitle) {
    _tasks.add(Task(title: taskTitle));
    notifyListeners();
  }

  void updateTaskState(Task task) {
    task.updateState();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
