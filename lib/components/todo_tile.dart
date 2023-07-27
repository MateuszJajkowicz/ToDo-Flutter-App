import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String title;
  final String content;
  final bool isDone;
  final Function(bool?)? onChanged;
  final VoidCallback onDelete;

  const ToDoTile({
    super.key,
    required this.title,
    required this.content,
    required this.isDone,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(title),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        margin: const EdgeInsets.only(top: 24),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        onDelete();
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24, top: 24),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xfff1e5bc),
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
                    activeColor: const Color(0xFFd8914c),
                    checkColor: Colors.black,
                  ),

                  // task name
                  Expanded(
                    // To expand the Text to the left
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        decoration: isDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                  ),

                  // delete button
                  IconButton(
                    onPressed: onDelete,
                    icon: const Icon(
                      Icons.delete,
                    ),
                  )
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
      ),
    );
  }
}
