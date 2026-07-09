
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: HeaderExerciseTwo()));
}

class HeaderExerciseTwo extends StatelessWidget {
  const HeaderExerciseTwo({super.key});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 191, 199, 219),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(18)
                ),
                child: const Icon(
                  Icons.checklist_rounded,
                  color: Colors.white,
                  size: 30
                )
              ),
              const SizedBox(width: 14),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Tasks',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  Text(
                    'Stay organized today',
                    style: TextStyle(color: Colors.grey)
                  )
                ]
              )
            ]
          ),
        )
      )
    );
  }
}
