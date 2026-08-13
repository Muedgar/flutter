import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Example5()));
}

class Todo {
  String name;
  bool completed;

  Todo({
    required this.name,
    required this.completed,
  });
}

class Example5 extends StatefulWidget {
  const Example5({super.key});

  @override
  State<Example5> createState() => _Example5State();
}

class _Example5State extends State<Example5> {
  List<Todo> todos = [
    Todo(name: "Flutter", completed: false),
    Todo(name: "React", completed: true),
  ];

  void toggle(Todo todo, bool? value) {
    setState(() {
      todo.completed = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (_, index) {
          final todo = todos[index];

          return CheckboxListTile(
            value: todo.completed,
            onChanged: (value) => toggle(todo, value),
            title: Text(
              todo.name,
              style: TextStyle(
                decoration: todo.completed
                    ? TextDecoration.lineThrough
                    : null,
              ),
            ),
          );
        },
      ),
    );
  }
}