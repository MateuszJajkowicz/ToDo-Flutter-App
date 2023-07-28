import 'package:flutter/material.dart';
import 'package:todo/models/note_model.dart';

class AddNotePage extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  AddNotePage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // title of note
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),

                  // content of note
                  TextFormField(
                    controller: contentController,
                    maxLines: null,
                    decoration: const InputDecoration(
                      labelText: 'Content',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the content';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),

                  // save button
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        _saveNoteAndGoBack(context);
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _saveNoteAndGoBack(BuildContext context) {
    // Only proceed if the form is valid
    if (_formKey.currentState!.validate()) {
      final title = titleController.text;
      final content = contentController.text;

      // Create a new note from the input values
      final newNote = Note(title: title, content: content, isDone: false);

      // Get the previous route (HomePage) and pass the new note as a result
      Navigator.pop(context, newNote);
    }
  }
}
