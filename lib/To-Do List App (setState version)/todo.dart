import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Todo {
  final String id;
  String name;
  bool completed;

  Todo({
    required this.id,
    required this.name,
    required this.completed,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const TodoPage(),
    );
  }
}

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController _controller = TextEditingController();

  final List<Todo> todos = [];

  Todo? editingTodo;

  void _saveTodo() {
    final text = _controller.text.trim();

    if (text.isEmpty) return;

    setState(() {
      if (editingTodo == null) {
        todos.add(
          Todo(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            name: text,
            completed: false,
          ),
        );
      } else {
        editingTodo!.name = text;
        editingTodo = null;
      }

      _controller.clear();
    });
  }

  void _startEdit(Todo todo) {
    setState(() {
      editingTodo = todo;
      _controller.text = todo.name;
    });
  }

  void _deleteTodo(String id) {
    setState(() {
      todos.removeWhere((todo) => todo.id == id);
    });
  }

  void _toggleComplete(Todo todo, bool? value) {
    setState(() {
      todo.completed = value ?? false;
    });
  }

  int get completedCount => todos.where((todo) => todo.completed).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f6fb),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Header
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Icon(
                      Icons.checklist_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
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
                        ),
                      ),
                      Text(
                        'Stay organized today',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Stats card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.indigo, Colors.deepPurple],
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  '$completedCount of ${todos.length} tasks completed',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Input
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: editingTodo == null
                              ? 'Add a new task...'
                              : 'Update task...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _saveTodo,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(editingTodo == null ? 'Add' : 'Save'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // List
              Expanded(
                child: todos.isEmpty
                    ? const Center(
                        child: Text(
                          'No tasks yet.\nAdd your first task above.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      )
                    : ListView.separated(
                        itemCount: todos.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final todo = todos[index];

                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 12,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: todo.completed,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  onChanged: (value) =>
                                      _toggleComplete(todo, value),
                                ),

                                Expanded(
                                  child: Text(
                                    todo.name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      decoration: todo.completed
                                          ? TextDecoration.lineThrough
                                          : null,
                                      color: todo.completed
                                          ? Colors.grey
                                          : Colors.black87,
                                    ),
                                  ),
                                ),

                                IconButton(
                                  onPressed: () => _startEdit(todo),
                                  icon: const Icon(
                                    Icons.edit_rounded,
                                    color: Colors.indigo,
                                  ),
                                ),

                                IconButton(
                                  onPressed: () => _deleteTodo(todo.id),
                                  icon: const Icon(
                                    Icons.delete_rounded,
                                    color: Colors.redAccent,
                                  ),
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
      ),
    );
  }
}