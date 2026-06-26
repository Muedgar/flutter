import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Example3()));
}

class Example3 extends StatefulWidget {
  const Example3({super.key});

  @override
  State<Example3> createState() => _Example3State();
}

class _Example3State extends State<Example3> {
  List<String> tasks = [
    "Flutter",
    "React",
    "NextJS",
  ];

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (_, index) {
          return ListTile(
            title: Text(tasks[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => deleteTask(index),
            ),
          );
        },
      ),
    );
  }
}