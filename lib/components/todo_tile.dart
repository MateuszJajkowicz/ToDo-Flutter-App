import 'package:flutter/material.dart';
import 'package:todo/components/custom_dialog.dart';
import 'package:todo/components/popup_menu.dart';

import '../models/note_model.dart';

class ToDoTile extends StatelessWidget {
  final String id;
  final String title;
  final String content;
  final bool isDone;
  final Function(bool?) onChanged;
  final VoidCallback onDelete;
  final VoidCallback onDeleteConfirmed;
  final Function(String, String) onUpdateNote;

  const ToDoTile({
    super.key,
    required this.id,
    required this.title,
    required this.content,
    required this.isDone,
    required this.onChanged,
    required this.onDelete,
    required this.onDeleteConfirmed,
    required this.onUpdateNote,
  });

  @override
  Widget build(BuildContext context) {
    final buttonKey = GlobalKey();

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
      // Use confirmDismiss to show the delete confirmation dialog
      confirmDismiss: (_) async {
        return await showDialog(
          context: context,
          builder: (context) => CustomDialog(
            text: 'Delete Note',
            content: 'Are you sure you want to delete this note?',
            onConfirm: () =>
                onDeleteConfirmed(), // Always return true if confirmed
          ),
        );
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
                  // task name
                  Expanded(
                    // To expand the Text to the left
                    child: Text(
                      title,
                      style: TextStyle(
                        color: const Color(0xff1b2639),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        decoration: isDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                  ),

                  // Show the popup menu when the IconButton is tapped
                  IconButton(
                    key: buttonKey,
                    onPressed: () {
                      PopupMenu.showPopupMenu(
                        context,
                        Note(
                          id: id,
                          title: title,
                          content: content,
                          isDone: isDone,
                        ),
                        onChanged,
                        onDelete,
                        buttonKey,
                        onUpdateNote,
                      );
                    },
                    icon: const Icon(Icons.more_vert),
                  ),
                ],
              ),

              // task content
              Text(
                content,
                style: TextStyle(
                  color: const Color(0xff1b2639),
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
