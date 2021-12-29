// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/Widgets/small_widgets.dart';
import 'package:todo_application/Widgets/task.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/src/flutter/padding.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TaskProvider>(context).tasks;
    // return GridView.builder(
    //   shrinkWrap: true,
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
    //   physics: BouncingScrollPhysics(),
    //   padding: EdgeInsets.all(16),
    //   // separatorBuilder: (context, index) => Container(height: 8),
    //   itemCount: tasks.length,
    //   itemBuilder: (context, index) {
    //     final task = tasks[index];
    //     return TaskUI(task: task);
    //   },
    // ).p4();
    return MasonryGridView.count(
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
    return InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).cardColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              task.title.text
                  .size(16)
                  .bold
                  .capitalize
                  .make()
                  .pOnly(top: 12, bottom: 8, left: 12, right: 8),
              if (task.desc.isNotEmpty)
                task.desc.text
                    .size(16)
                    .light
                    .make()
                    .pOnly(bottom: 8, left: 12, right: 12),
            ],
          ),
        )).p4();
  }
}
