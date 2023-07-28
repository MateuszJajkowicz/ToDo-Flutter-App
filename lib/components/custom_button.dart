import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final ButtonType buttonType;
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.buttonType,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return buttonType == ButtonType.elevated
        ? ElevatedButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: const TextStyle(color: Colors.black),
            ),
          )
        : OutlinedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              side: MaterialStateProperty.resolveWith<BorderSide>(
                (states) {
                  return const BorderSide(color: Color(0xFFd8914c));
                },
              ),
            ),
            child: Text(text, style: const TextStyle(color: Colors.black)),
          );
  }
}

enum ButtonType {
  elevated,
  outlined,
}
