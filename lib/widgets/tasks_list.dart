import 'package:flutter/material.dart';
import '../models/task.dart';
import 'task_tile.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasks;
  final void Function(Task task) onCheckPressed;
  final void Function(Task task) onLongPress;
  // final VoidCallback onLongPress;

  TasksList(
      {required this.tasks,
      required this.onCheckPressed,
      required this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final task = tasks[index];
        return TaskTile(
            title: task.title,
            isChecked: task.state,
            onCheckboxPress: (state) {
              onCheckPressed(task);
            },
            onLongPress: () {
              onLongPress(task);
            });
      },
      itemCount: tasks.length,
    );
  }
}
