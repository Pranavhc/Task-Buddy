// ignore_for_file: implementation_imports, prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/src/flutter/padding.dart';

class NavigatingElevatedButton extends StatelessWidget {
  const NavigatingElevatedButton({
    Key? key,
    required this.string,
    this.location,
  }) : super(key: key);

  final String string;
  final Widget? location;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 150,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.cyan, Colors.deepPurpleAccent],
          )),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => location!));
        },
        child: string.text.lg.semiBold.white.make().p12(),
        style: ButtonStyle(
            shadowColor: MaterialStateProperty.all(Colors.transparent),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)))),
      ),
    );
  }
}
