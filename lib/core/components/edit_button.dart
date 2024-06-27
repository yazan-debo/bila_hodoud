import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // Handle button press event
      },
      icon: const Icon(Icons.edit),
      label: const Text(
        'تعديل',
        style: TextStyle(
          fontFamily: 'Arabic',
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),
    );
  }
}
