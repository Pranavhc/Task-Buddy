// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TaskForm extends StatelessWidget {
  final String title;
  final String desc;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDesc;
  final VoidCallback onSavedTask;

  const TaskForm({
    Key? key,
    this.title = '',
    this.desc = '',
    required this.onChangedTitle,
    required this.onChangedDesc,
    required this.onSavedTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            buildTitle(),
            HeightBox(20),
            buildDesc(),
            HeightBox(20),
            buildButton(),
          ],
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 2,
        maxLength: 30,
        initialValue: title,
        autocorrect: true,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title!.isEmpty) return "Cannot be empty";
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          hintText: "Enter The Title",
        ),
      ).pOnly(left: 16, right: 16);

  Widget buildDesc() => TextFormField(
        maxLines: 3,
        initialValue: desc,
        autocorrect: true,
        onChanged: onChangedDesc,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          hintText: "Enter The Description",
        ),
      ).pOnly(left: 16, right: 16);

  Widget buildButton() => SizedBox(
        child: Container(
          height: 40,
          width: 120,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.cyan, Colors.deepPurpleAccent],
              )),
          child: ElevatedButton(
            style: ButtonStyle(
                shadowColor: MaterialStateProperty.all(Colors.transparent),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)))),
            onPressed: onSavedTask,
            child: "Save Task".text.bold.white.make(),
          ),
        ),
      );
}
