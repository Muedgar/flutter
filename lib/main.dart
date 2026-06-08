

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: TaskCardExercise()));
}

class TaskCardExercise extends StatelessWidget {
  const TaskCardExercise({super.key});

  @override
  Widget build(BuildContext context) {
    const completed = true;

    return Scaffold(
      backgroundColor: const Color(0xfff4f6fb),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 12,
                offset: const Offset(0, 6)
              )
            ]
          ),
          child: Row(
            children: [
              Checkbox(
                value: completed,
                onChanged: (_) {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)
                )
              ),
              const Expanded(
                child: Text(
                  'Study Flutter UI',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey
                  )
                )
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit_rounded, color: Colors.indigo,)
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete_rounded, color: Colors.redAccent) 
              )
            ],
          )
        )
      )
    );
  }
}