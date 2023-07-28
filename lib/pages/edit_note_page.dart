import 'package:flutter/material.dart';
import 'package:todo/components/custom_button.dart';
import 'package:todo/models/note_model.dart';

class EditNotePage extends StatelessWidget {
  final Note note;

  const EditNotePage({required this.note, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController =
        TextEditingController(text: note.title);
    final TextEditingController contentController =
        TextEditingController(text: note.content);

    void updateNoteAndGoBack(BuildContext context) {
      final title = titleController.text;
      final content = contentController.text;

      // Create an updated note from the input values
      final updatedNote = Note(
        id: note.id,
        title: title,
        content: content,
        isDone: note.isDone,
      );

      // Get the previous route and pass the updated note as a result
      Navigator.pop(context, updatedNote);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xfff1e5bc),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // title of note
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                ),
                const SizedBox(height: 16.0),

                // content of note
                TextField(
                  controller: contentController,
                  maxLines: null,
                  decoration: const InputDecoration(
                    labelText: 'Content',
                  ),
                ),
                const SizedBox(height: 16.0),

                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Cancel button
                      CustomButton(
                        buttonType: ButtonType.outlined,
                        text: 'Cancel',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(width: 16),

                      // Save button
                      CustomButton(
                        buttonType: ButtonType.elevated,
                        text: "Save",
                        onPressed: () {
                          updateNoteAndGoBack(context);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
