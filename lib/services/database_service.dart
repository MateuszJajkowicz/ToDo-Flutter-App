import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:todo/models/note_model.dart';

class Database {
  static const String _fileName = 'notes.json';

  // Function to get the file where the notes will be stored
  Future<File> _getNotesFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$_fileName');
  }

  // Function to read notes from the file
  Future<List> readNotes() async {
    try {
      final file = await _getNotesFile();
      if (!file.existsSync()) {
        return [];
      }

      final jsonContent = await file.readAsString();
      final List<dynamic> jsonData = json.decode(jsonContent);
      final List<dynamic> notes =
          jsonData.map((data) => Note.fromJson(data)).toList();
      return notes;
    } catch (e) {
      return [];
    }
  }

  // Function to write notes to the file
  Future<void> writeNotes(List<Note> notes) async {
    final file = await _getNotesFile();
    final jsonData = notes.map((note) => note.toJson()).toList();
    await file.writeAsString(json.encode(jsonData));
  }
}
