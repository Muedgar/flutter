import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Example1()));
}

class Todo {
  final String name;

  Todo({required this.name});
}

class Example1 extends StatelessWidget {
  Example1({super.key});

  final List<Todo> todos = [
    Todo(name: "Study Flutter"),
    Todo(name: "Go Running"),
    Todo(name: "Read Book"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Todo List")),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (_, index) {
          return ListTile(
            title: Text(todos[index].name),
          );
        },
      ),
    );
  }
}