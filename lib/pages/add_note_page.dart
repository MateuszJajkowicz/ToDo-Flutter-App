import 'package:flutter/material.dart';
import 'package:todo/models/note_model.dart'; // Import the Note class

class AddNotePage extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Add Note', style: Theme.of(context).textTheme.headlineSmall),
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
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: contentController,
                  maxLines: null,
                  decoration: const InputDecoration(
                    labelText: 'Content',
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Save the new note and go back to the HomePage
                    saveNoteAndGoBack(context);
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveNoteAndGoBack(BuildContext context) {
    final title = titleController.text;
    final content = contentController.text;

    // Create a new note from the input values
    final newNote = Note(title: title, content: content, isDone: false);

    // Get the previous route (HomePage) and pass the new note as a result
    Navigator.pop(context, newNote);
  }
}
