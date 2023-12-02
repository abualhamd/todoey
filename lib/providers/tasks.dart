import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/task.dart';

part 'tasks.g.dart';

@riverpod
class Tasks extends _$Tasks {
  @override
  List<Task> build() {
    return [];
  }

  void addTask({required Task task}) {
    state = [...state, task];
  }

  void removeTask({required Task task}) {
    state.remove(task);
    state = [...state];
  }

  void toggleTaskStatus({required Task task}) {
    state = state.map((e) {
      if (e == task) {
        e.updateState();
      }
      return e;
    }).toList();
  }
}
