import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: TodoPage()));
}

class Todo {
  String id;
  String name;
  bool completed;

  Todo({
    required this.id,
    required this.name,
    required this.completed,
  });
}

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController control = TextEditingController();

  List<Todo> todos = [];

  void handleAdd() {
    if (control.text.trim().isEmpty) return;

    setState(() {
      todos.add(
        Todo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          name: control.text.trim(),
          completed: false,
        ),
      );

      control.clear();
    });
  }

  void handleChecked(String id, bool? value) {
    setState(() {
      final todo = todos.firstWhere((todo) => todo.id == id);
      todo.completed = value ?? false;
    });
  }

  void handleEdit(String id) {
    // later
  }

  void handleDelete(String id) {
    setState(() {
      todos.removeWhere((todo) => todo.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: control,
                    decoration: const InputDecoration(
                      hintText: 'Enter todo',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: handleAdd,
                  child: const Text('Add'),
                ),
              ],
            ),

            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (_, index) {
                  final todo = todos[index];

                  return ListTile(
                    leading: Checkbox(
                      value: todo.completed,
                      onChanged: (value) {
                        handleChecked(todo.id, value);
                      },
                    ),
                    title: Text(
                      todo.name,
                      style: TextStyle(
                        decoration: todo.completed
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            handleEdit(todo.id);
                          },
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            handleDelete(todo.id);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}