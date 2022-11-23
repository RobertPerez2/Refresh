import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Individual extends StatelessWidget {
  final String taskName;
  final bool completedTask;
  Function(bool?) onChanged;
  Function(BuildContext)? deleteTask;

  Individual({
    super.key,
    required this.taskName,
    required this.completedTask,
    required this.onChanged,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete_forever,
              backgroundColor: Colors.red,
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Checkbox(
                checkColor: const Color(0xFF81D4FA),
                value: completedTask,
                onChanged: onChanged,
                activeColor: Colors.white,
              ),
              Text(
                taskName,
                style: TextStyle(
                  color: const Color(0xFFFFFFFF),
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  letterSpacing: 2.0,
                  fontFamily: 'Lato',
                  decoration: completedTask
                      ? TextDecoration.lineThrough
                      : TextDecoration.none)
              ),
            ],),
        ),
      ),
    );
  }
}
