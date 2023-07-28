import 'package:flutter/material.dart';
import 'package:todo/components/custom_button.dart';

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
        // cancel button
        CustomButton(
          buttonType: ButtonType.outlined,
          text: 'Cancel',
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        // confirm button
        CustomButton(
          buttonType: ButtonType.elevated,
          text: 'Confirm',
          onPressed: () {
            Navigator.pop(context);
            onConfirm();
          },
        ),
      ],
    );
  }
}
