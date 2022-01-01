// ignore_for_file: prefer_const_constructors, implementation_imports, use_key_in_widget_constructors, unnecessary_import
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/Widgets/task.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/src/flutter/padding.dart';
import 'package:velocity_x/velocity_x.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TaskProvider>(context).tasks;

    return tasks.isEmpty
        ? Center(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/black_cat.gif",
                  height: 300,
                  width: 300,
                ).p0(),
                "Common add something to do!"
                    .text
                    .xl
                    .color(Theme.of(context).colorScheme.primary)
                    .make()
                    .p0(),
              ],
            ),
          )
        : MasonryGridView.count(
            itemBuilder: (context, index) {
              final task = tasks[index];
              return TaskUI(task: task);
            },
            physics: BouncingScrollPhysics(),
            crossAxisCount: 2,
            itemCount: tasks.length,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            shrinkWrap: true,
            padding: EdgeInsets.all(12),
          );
  }
}

class TaskUI extends StatelessWidget {
  const TaskUI({Key? key, required this.task}) : super(key: key);
  final Task task;
  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).cardColor,
      ),
      child: InkWell(
        splashColor: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.circular(10),
        onTap: () {}, //edit
        onLongPress: () => deleteTask(context, task), //delete

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (task.title.isNotEmpty && task.title.isNotBlank)
              task.title.text
                  .size(16)
                  .bold
                  .capitalize
                  .make()
                  .pOnly(bottom: 10, top: 10, left: 12, right: 12)
            else
              ": ( "
                  .text
                  .size(16)
                  .bold
                  .make()
                  .pOnly(top: 10, bottom: 10, left: 12, right: 8),
            if (task.desc!.isNotEmpty)
              task.desc!.text
                  .size(16)
                  .light
                  .capitalize
                  .make()
                  .pOnly(bottom: 10, left: 12, right: 12),
          ],
        ),
      ).p1(),
    ).p4();
  }

  deleteTask(BuildContext context, Task task) {
    final provider = Provider.of<TaskProvider>(context, listen: false);
    provider.deleteTask(task);
    return SnackBar(content: "Task deleted!".text.make());
  }
}
