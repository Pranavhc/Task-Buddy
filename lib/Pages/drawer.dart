// ignore_for_file: prefer_const_constructors, implementation_imports, unnecessary_import
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/Utils/themes.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/src/flutter/padding.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).canvasColor,
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              tileColor: Theme.of(context).cardColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  "Settings".text.xl.bold.make().p12(),
                  "Todo 1.0".text.size(16).light.caption(context).make().p12()
                ],
              ),
            ),
            Image.asset(
              "assets/images/logo.jpg",
            ),
            ListTile(
              tileColor: Theme.of(context).cardColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Dark Mode".text.lg.bold.make().p12(),
                  Switch.adaptive(
                    activeColor: Colors.deepPurpleAccent,
                    onChanged: (value) {
                      final provider =
                          Provider.of<ThemeProvider>(context, listen: false);
                      provider.toggleTheme(value);
                    },
                    value: Provider.of<ThemeProvider>(context).isDarkMode,
                  ),
                ],
              ),
            ),
            HeightBox(20),
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "How to Use ?"
                      .text
                      .lg
                      .bold
                      .make()
                      .pOnly(left: 16, bottom: 16),
                  captionText("1. Tap on 'Add Task' to add a task"),
                  captionText("2. Type Title and description of your task"),
                  captionText("3. Tap on 'Save' to add it in your task list"),
                  captionText("4. Tick task when you complete it."),
                  captionText("5. Swipe to delete any task"), // Dissmissible
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget captionText(String string) {
    return string.text.size(16).coolGray500.make().pOnly(left: 16, bottom: 16);
  }
}
