import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: StatsCardExercise()));
}

class StatsCardExercise extends StatelessWidget {
  const StatsCardExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f6fb),
      body: Center(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.indigo, Colors.deepPurple],
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Text(
            '3 of 7 tasks completed',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}