import 'package:flutter/material.dart';
import 'package:todo/pages/home_page.dart';
import 'package:todo/pages/add_note_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/addNote': (context) => const AddNotePage(),
      },
    );
  }
}
