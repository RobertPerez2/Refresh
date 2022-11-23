import 'package:flutter/material.dart';
import 'myButton.dart';

class DialogAnswer extends StatelessWidget {
  final controller;

  VoidCallback onSave;
  VoidCallback onCancel;

  DialogAnswer({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFFFAFDD6),
      content: Container(
        height: 100,
        child: Column(children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(hintText: "Write a task"),
          ),
          Row(
            children: [
              MyButton(text: "save", onPressed: onSave),
              MyButton(text: "cancel", onPressed: onCancel)
            ],
          )
        ]),
      ),
    );
  }
}
