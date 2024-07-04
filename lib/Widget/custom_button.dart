import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isEnabled;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isEnabled = true, Color? backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        child: Text(text),
      ),
    );
  }
}
