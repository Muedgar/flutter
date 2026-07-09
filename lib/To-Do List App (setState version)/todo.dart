import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: TodoPage());
  }
}

class Todo {
  final String id;
  final String title;
  bool completed;

  Todo({required this.id, required this.title, required this.completed});
}

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController controller = TextEditingController();

  List<Todo> todos = [
    Todo(id: '1', title: 'Breakfast', completed: false),
    Todo(id: '2', title: 'Lunch', completed: false),
    Todo(id: '3', title: 'Dinner', completed: false),
  ];

  void addTodo() {
    final title = controller.text.trim();
    if (title.isEmpty) return;

    setState(() {
      todos.add(
        Todo(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          title: title,
          completed: false,
        ),
      );
      controller.clear();
    });
  }

  void editTodo() {}

  void deleteTodo(Todo todo) {
    setState(() {
      todos.removeWhere((item) => item.id == todo.id);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo')),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(child: TextField(controller: controller)),
              ElevatedButton(onPressed: addTodo, child: const Text('Add Todo')),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (_, index) {
                final todo = todos[index];

                return ListTile(
                  title: Text(todo.title),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: editTodo,
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () => deleteTodo(todo),
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
    );
  }
}
