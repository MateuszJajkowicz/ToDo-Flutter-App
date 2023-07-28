import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:todo/components/custom_button.dart';
import 'package:todo/models/note_model.dart';

class AddNotePage extends StatelessWidget {
  final uuid = const Uuid();
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
                    autofocus: true,
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
                            _saveNoteAndGoBack(context);
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
      ),
    );
  }

  void _saveNoteAndGoBack(BuildContext context) {
    // Only proceed if the form is valid
    if (_formKey.currentState!.validate()) {
      final title = titleController.text;
      final content = contentController.text;

      // Create a new note from the input values
      final newNote =
          Note(id: uuid.v1(), title: title, content: content, isDone: false);

      // Get the previous route (HomePage) and pass the new note as a result
      Navigator.pop(context, newNote);
    }
  }
}
