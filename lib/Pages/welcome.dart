// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:todo_application/Pages/home.dart';
import 'package:todo_application/Widgets/navigating_elevatedbutton.dart';
import 'package:velocity_x/velocity_x.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        backgroundBlendMode: BlendMode.color,
        gradient: LinearGradient(
            colors: [Colors.deepPurpleAccent, Colors.blueGrey.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/cat_walk2.gif'),
            "Hi there,".text.semiBold.black.xl.make().p4(),
            "I'm your task buddy"
                .text
                .color(Colors.deepPurple.shade900)
                .bold
                .xl2
                .make()
                .p4(),
            "Your task app to keep track of every thing you do"
                .text
                .semiBold
                .size(14)
                .coolGray200
                .make()
                .pOnly(top: 4, bottom: 32),
            NavigatingElevatedButton(
              string: "Hi Buddy",
              location: Home(),
            )
          ],
        ),
      ),
    );
  }
}
