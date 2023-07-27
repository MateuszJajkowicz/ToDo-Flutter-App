class Note {
  String title;
  String content;
  bool isDone;

  Note({
    required this.title,
    required this.content,
    required this.isDone,
  });

  // Factory method to create a Note instance from a JSON map
  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      title: json['title'],
      content: json['content'],
      isDone: json['isDone'],
    );
  }

  // Method to convert a Note instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'isDone': isDone,
    };
  }
}
