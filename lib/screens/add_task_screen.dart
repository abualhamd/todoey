import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AddTaskScreen extends HookWidget {
  final void Function(String taskTitle) onPressed;

  AddTaskScreen({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final TextEditingController taskTitleController =
        useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());

    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom * 0.25),
      child: Form(
        key: formKey,
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
                      onPressed(taskTitleController.text);
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
