import 'package:flutter/material.dart';
import 'package:todo/models/note_model.dart';

class HomePage extends StatelessWidget {
  final List<Note> notes = [
    Note(title: 'Title', content: 'Content', isDone: false),
    Note(title: 'Title2', content: 'Content2', isDone: true),
  ]; // Lista przechowująca notatki

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo App'),
      ),
      body: notes.isEmpty
          ? const Center(
              child: Text('Brak notatek'),
            )
          : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(notes[index].title),
                  subtitle: Text(notes[index].content),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addNote');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
