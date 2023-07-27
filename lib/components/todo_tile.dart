import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String title;
  final String content;
  final bool isDone;
  Function(bool?)? onChanged;

  ToDoTile({
    required this.title,
    required this.content,
    required this.isDone,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // checkbox
                Checkbox(
                  value: isDone,
                  onChanged: onChanged,
                ),

                // task name
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ],
            ),

            // task content
            Text(
              content,
              style: TextStyle(
                fontSize: 16,
                decoration:
                    isDone ? TextDecoration.lineThrough : TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
