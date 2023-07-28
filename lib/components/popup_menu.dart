import 'package:flutter/material.dart';

class PopupMenu {
  static void showPopupMenu(BuildContext context, bool isDone,
      Function(bool?) onChanged, VoidCallback onDelete, GlobalKey buttonKey) {
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
            leading: isDone
                ? const Icon(
                    Icons.check_box,
                    color: Color(0xFFd8914c),
                  )
                : const Icon(
                    Icons.check_box_outline_blank,
                    color: Color(0xFFd8914c),
                  ),
            title: const Text('Mark as Done'),
            onTap: () {
              onChanged(!isDone);
              Navigator.pop(context);
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
            title: const Text('Delete'),
            onTap: onDelete,
          ),
        ),
      ],
    );
  }
}
