// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, implementation_imports, unused_import, unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/Widgets/task.dart';
import 'package:todo_application/Widgets/task_form.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/src/flutter/padding.dart';
import 'package:velocity_x/velocity_x.dart';

class AddTaskUI extends StatefulWidget {
  const AddTaskUI({Key? key}) : super(key: key);

  @override
  State<AddTaskUI> createState() => _AddTaskUIState();
}

class _AddTaskUIState extends State<AddTaskUI> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String desc = '';
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        CupertinoIcons.back,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      alignment: Alignment.centerLeft,
                    ).p16(),
                    Text(
                      "Add Task",
                      style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.primary),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                HeightBox(20),
                TaskForm(
                  onChangedTitle: (title) => setState(() => this.title = title),
                  onChangedDesc: (desc) => setState(() => this.desc = desc),
                  onSavedTask: () => addTask(),
                )
              ],
            ),
          ),
        ),
      );
  addTask() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      final task = Task(
        id: DateTime.now().toString(),
        title: title,
        desc: desc,
      );
      Provider.of<TaskProvider>(context, listen: false).addTask(task);
      Navigator.pop(context);
    }
  }

  
}
