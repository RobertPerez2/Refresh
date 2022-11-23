import 'package:flutter/material.dart';

class emoji_face extends StatelessWidget {
  final String emojiface;

  const emoji_face({Key? key,
    required this.emojiface,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(12),
    ),
    padding: EdgeInsets.all(12),
    child: Center(
    child: Text(
      emojiface,
    style: TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    ),
    ),
    );
  }
}
