import 'package:flutter/material.dart';
import 'package:todo/models/note_model.dart';
import 'package:todo/pages/edit_note_page.dart';

class PopupMenu {
  static void showPopupMenu(
    BuildContext context,
    Note note,
    Function(bool?) onChanged,
    VoidCallback onDelete,
    GlobalKey buttonKey,
    final Function(String, String) onUpdateNote,
  ) {
    final RenderBox popupButton =
        buttonKey.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = popupButton.localToGlobal(Offset.zero);

    showMenu(
      color: const Color(0xfff1e5bc),
      context: context,
      position: RelativeRect.fromLTRB(offset.dx, offset.dy, 0, 0),
      items: [
        // isDone checkbox
        PopupMenuItem(
          child: ListTile(
            leading: note.isDone
                ? const Icon(
                    Icons.check_box,
                    color: Color(0xFFd8914c),
                  )
                : const Icon(
                    Icons.check_box_outline_blank,
                    color: Color(0xFFd8914c),
                  ),
            title: const Text(
              'Mark as Done',
              style: TextStyle(
                color: Color(0xff1b2639),
              ),
            ),
            onTap: () {
              onChanged(!note.isDone);
              Navigator.pop(context);
            },
          ),
        ),

        // edit icon
        PopupMenuItem(
          child: ListTile(
            leading: const Icon(
              Icons.edit,
              color: Color(0xFFd8914c),
            ),
            title: const Text(
              'Edit',
              style: TextStyle(
                color: Color(0xff1b2639),
              ),
            ),
            onTap: () {
              // Navigate to EditNotePage when the "Edit" option is tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditNotePage(note: note),
                ),
              ).then((updatedNote) {
                // Handle the updated note data returned from the EditNotePage
                if (updatedNote != null && updatedNote is Note) {
                  // Call the onChanged callback to update the note
                  onUpdateNote(updatedNote.title, updatedNote.content);
                }
              });
            },
          ),
        ),

        // delete icon
        PopupMenuItem(
          child: ListTile(
            leading: const Icon(
              Icons.delete,
              color: Color(0xFFd8914c),
            ),
            title: const Text(
              'Delete',
              style: TextStyle(
                color: Color(0xff1b2639),
              ),
            ),
            onTap: onDelete,
          ),
        ),
      ],
    );
  }
}
