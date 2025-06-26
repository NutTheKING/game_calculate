import 'package:flutter/material.dart';

class CustomActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomActionButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      label: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.0,
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
        elevation: 6,
        shadowColor: Colors.black.withOpacity(0.3),
        backgroundColor: Colors.indigo.shade600,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ).copyWith(
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.hovered)) {
            return Colors.indigo.shade400;
          }
          return Colors.indigo.shade600;
        }),
      ),
    );
  }
}
