import 'package:flutter/material.dart';
import 'package:todoey/models/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late String taskTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        height: 450.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(30.0), topEnd: Radius.circular(30.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 60.0),
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
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hoverColor: Colors.lightBlueAccent,
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.lightBlueAccent,
                  )),
                ),
                onChanged: (title) {
                  taskTitle = title;
                },
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

                // style:
                // TextButton.styleFrom(
                // backgroundColor: Colors.lightBlueAccent,
                // textStyle: TextStyle(color: Colors.white),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.lightBlueAccent),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () {
                  Provider.of<TaskData>(context, listen: false)
                      .updateTasksList(taskTitle);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
