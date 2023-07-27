import 'package:flutter/material.dart';
import 'package:todo/components/todo_tile.dart';
import 'package:todo/models/note_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Note> notes = [
    Note(title: 'Title', content: 'Content', isDone: false),
    Note(
        title: 'Title2',
        content:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        isDone: true),
  ]; // Lista przechowująca notatki

  // checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      notes[index].isDone = !notes[index].isDone;
    });
  }

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
                return ToDoTile(
                  title: notes[index].title,
                  content: notes[index].content,
                  isDone: notes[index].isDone,
                  onChanged: (value) => checkBoxChanged(value, index),
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
