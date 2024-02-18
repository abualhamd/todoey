import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/task.dart';
import '../providers/tasks.dart';
import '../widgets/tasks_list.dart';
import 'add_task_screen.dart';

class TasksScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(tasksProvider);

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          elevation: 10.0,
          child: Icon(
            CupertinoIcons.add,
            color: Colors.white,
          ),
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => AddTaskScreen(
                onPressed: (taskTitle) {
                  ref
                      .read(tasksProvider.notifier)
                      .addTask(task: Task(title: taskTitle));
                  Navigator.pop(context);
                },
              ),
            );
          }),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.list,
                          color: Colors.lightBlueAccent,
                          size: 60.0,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Todoey',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${tasks.length} Tasks",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: TasksList(
                  tasks: tasks,
                  onCheckPressed: (task) {
                    ref
                        .read(tasksProvider.notifier)
                        .toggleTaskStatus(task: task);
                  },
                  onLongPress: (task) {
                    log(task.taskId);
                    ref.read(tasksProvider.notifier).removeTask(task: task);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
