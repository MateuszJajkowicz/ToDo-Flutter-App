import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String text;
  final String content;
  final VoidCallback onConfirm;

  const CustomDialog({
    super.key,
    required this.text,
    required this.content,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xfff1e5bc),
      elevation: 2,
      title: Text(text),
      content: Text(content),
      actions: [
        OutlinedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ButtonStyle(
            side: MaterialStateProperty.resolveWith<BorderSide>(
              (states) {
                return const BorderSide(color: Color(0xFFd8914c));
              },
            ),
          ),
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.black),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            onConfirm();
          },
          child: const Text(
            'Confirm',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
