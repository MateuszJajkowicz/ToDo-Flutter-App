import 'package:flutter/material.dart';
import 'package:todo/components/custom_dialog.dart';
import 'package:todo/components/todo_tile.dart';
import 'package:todo/models/note_model.dart';
import 'package:todo/services/database_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> notes = [];
  bool isLoading = true;

  final Database _database = Database();

  @override
  void initState() {
    super.initState();
    _loadNotes(); // Load notes from the database when the page is created
  }

  // Function to load notes from the database
  Future<void> _loadNotes() async {
    final loadedNotes = await _database.readNotes();
    setState(() {
      notes = List<Note>.from(loadedNotes);
      isLoading = false;
    });
  }

  // Funciton hangling checkbox tapping
  void checkBoxChanged(bool? value, int index) async {
    setState(() {
      notes[index].isDone = !notes[index].isDone;
    });

    await _database.writeNotes(notes);
  }

  // Method to delete the note from the list and database
  void deleteNote(int index, {confirmed}) {
    if (confirmed) {
      handleRemovingNote(index);
    } else {
      showDialog(
        context: context,
        builder: (context) => CustomDialog(
          text: 'Delete Note',
          content: 'Are you sure you want to delete this note?',
          onConfirm: () {
            handleRemovingNote(index, confirmed: true);
          },
        ),
      );
    }
  }

  void handleRemovingNote(int index, {confirmed}) {
    setState(() {
      notes.removeAt(index);
    });
    _database.writeNotes(notes);
    if (confirmed) {
      Navigator.pop(context);
    }
    showSnackBar("Note deleted successfully");
  }

  // Function to update the title and content of a note
  void updateNote(int index, String newTitle, String newContent) {
    setState(() {
      notes[index].title = newTitle;
      notes[index].content = newContent;
    });

    _database.writeNotes(notes);
    Navigator.pop(context);
    showSnackBar("Note updated successfully");
  }

  // Function to handle navigation to the AddNotePage and get the new note
  Future<void> _navigateToAddNotePage(BuildContext context) async {
    final newNote = await Navigator.pushNamed(context, '/addNote') as Note?;

    // Check if the new note is not null (it means the user saved the note)
    if (newNote != null) {
      setState(() {
        notes.add(newNote);
      });
      _database.writeNotes(notes);
      showSnackBar("Note added successfully");
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
        backgroundColor: const Color(0xFFd8914c),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo App'),
      ),
      body: isLoading
          ? const Center(
              // Show the spinner while notes are loading
              child: CircularProgressIndicator(
                color: Color(0xFFd8914c),
              ),
            )
          : notes.isEmpty
              ? const Center(
                  child: Text(
                    'No notes',
                    style: TextStyle(
                      color: Color(0xFFd8914c),
                      fontSize: 24,
                    ),
                  ),
                )

              // List of notes
              : ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    return ToDoTile(
                      id: notes[index].id,
                      title: notes[index].title,
                      content: notes[index].content,
                      isDone: notes[index].isDone,
                      onChanged: (value) => checkBoxChanged(value, index),
                      onDelete: () => deleteNote(index, confirmed: false),
                      onDeleteConfirmed: () =>
                          deleteNote(index, confirmed: true),
                      onUpdateNote: (newTitle, newContent) =>
                          updateNote(index, newTitle, newContent),
                    );
                  },
                ),

      // Button redirecting to AddNotePage
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToAddNotePage(context);
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
