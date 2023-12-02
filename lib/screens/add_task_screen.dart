import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/task.dart';
import '../providers/tasks.dart';

class AddTaskScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController taskTitleController =
        useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());

    return Form(
      key: formKey,
      child: Container(
        color: Color(0xff757575),
        child: Container(
          height: 450.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(30.0), topEnd: Radius.circular(30.0)),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 60.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Add Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 30.0,
                  ),
                ),
                TextFormField(
                  autofocus: true,
                  controller: taskTitleController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "please Enter a task Title";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hoverColor: Colors.lightBlueAccent,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                TextButton(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      'Add',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.lightBlueAccent),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      ref.read(tasksProvider.notifier).addTask(
                          task: Task(
                              title: taskTitleController.text, state: false));
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
