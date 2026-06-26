import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: EmptyStateExercise()));
}

class EmptyStateExercise extends StatelessWidget {
  const EmptyStateExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f6fb),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.inbox_rounded,
              size: 64,
              color: Colors.grey,
            ),
            SizedBox(height: 14),
            Text(
              'No tasks yet',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Add your first task above.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}