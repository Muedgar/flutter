import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Example4()));
}

class Example4 extends StatefulWidget {
  const Example4({super.key});

  @override
  State<Example4> createState() => _Example4State();
}

class _Example4State extends State<Example4> {
  final controller = TextEditingController();

  List<String> tasks = [
    "Flutter",
    "React",
  ];

  int? editingIndex;

  void saveTask() {
    setState(() {
      tasks[editingIndex!] = controller.text;

      editingIndex = null;
      controller.clear();
    });
  }

  void startEdit(int index) {
    controller.text = tasks[index];

    setState(() {
      editingIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(controller: controller),

          ElevatedButton(
            onPressed: saveTask,
            child: const Text("Save"),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text(tasks[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => startEdit(index),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}