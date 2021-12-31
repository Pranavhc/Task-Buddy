// ignore_for_file: prefer_const_constructors, implementation_imports
import 'package:flutter/material.dart';
import 'package:todo_application/Pages/add_task_ui.dart';
import 'package:todo_application/Widgets/small_widgets.dart';
import 'package:todo_application/Widgets/task_list.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/src/flutter/padding.dart';

import 'drawer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
          elevation: 0.5,
          leading: Builder(
            builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(Icons.settings,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).canvasColor,
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          title: Column(
            children: [
              // make it time responsive later.
              "Have A Great Day !"
                  .text
                  .xl2
                  .bold
                  .color(Theme.of(context).colorScheme.primary)
                  .make()
                  .p4(),
              //tasks number should change, keeping it static for now.
              "You have 0 tasks to complete."
                  .text
                  .coolGray500
                  .lg
                  .caption(context)
                  .make(),
            ],
          )),
      drawer: MyDrawer(),
      body: TaskList(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          NavigatingElevatedButton(location: AddTaskUI(), string: "Add Task")
              .pOnly(bottom: 24));
}
