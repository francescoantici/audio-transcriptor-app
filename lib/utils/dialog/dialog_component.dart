import 'package:flutter/material.dart';

class CustomBaseDialog extends StatelessWidget {
  const CustomBaseDialog({
    required this.title,
    required this.content,
    this.onClose,
    this.closeButtonText = 'Chuidi',
    super.key,
  });

  final String title;
  final String content;
  final String closeButtonText;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        OutlinedButton(
          onPressed: onClose ?? () => Navigator.pop(context),
          child: Text(closeButtonText),
        ),
      ],
    );
  }
}
