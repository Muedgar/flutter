import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Example2()));
}

class Example2 extends StatefulWidget {
  const Example2({super.key});

  @override  
  State<Example2> createState() => _Example2State();
}

class _Example2State extends State<Example2> {
  final controller = TextEditingController();

  List<String> tasks = [];

  void addTask() {
    setState(() {
      tasks.add(controller.text);
      controller.clear();
    });
  }

  @override  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: controller),
            ElevatedButton(
              onPressed: addTask,
              child: const Text("Add")
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text(tasks[index])
                  );
                }
              )
            )
          ],
        )
      )
    );
  }

}