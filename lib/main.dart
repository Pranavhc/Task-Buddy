// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/Pages/home.dart';
import 'package:todo_application/Pages/welcome.dart';
import 'package:todo_application/Utils/routes.dart';
import 'package:todo_application/Utils/themes.dart';
import 'package:todo_application/Widgets/task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (BuildContext context) => TaskProvider(),
        child: ChangeNotifierProvider(
          create: (BuildContext context) => ThemeProvider(),
          builder: (context, _) {
            final themeProvider = Provider.of<ThemeProvider>(context);
            return MaterialApp(
              themeMode: themeProvider.themeMode,
              theme: MyTheme.lightTheme,
              darkTheme: MyTheme.darkTheme,
              debugShowCheckedModeBanner: false,
              initialRoute: '/welcome',
              routes: {
                '/': (context) => WelcomePage(),
                Routes.welcome: (context) => WelcomePage(),
                Routes.home: (context) => Home(),
              },
            );
          },
        ),
      );
}
