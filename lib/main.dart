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
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xfff1e5bc),
          iconTheme: IconThemeData(color: Color(0xff1b2639)),
          elevation: 0,
        ),
        scaffoldBackgroundColor: const Color(0xff1b2639),
        textTheme: const TextTheme(
          headlineSmall:
              TextStyle(color: Color(0xff1b2639), fontWeight: FontWeight.bold),
          bodySmall: TextStyle(color: Color(0xff1b2639)),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFd8914c),
          elevation: 0,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(
            color: Color(0xFFd8914c),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFd8914c)),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFd8914c)),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/addNote': (context) => AddNotePage(),
      },
    );
  }
}
