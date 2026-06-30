import 'package:flutter/material.dart';

void main() {
  runApp(
    TodoProvider(
      notifier: TodoStore(),
      child: const MyApp(),
    ),
  );
}

// =======================
// MODEL
// =======================

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

// =======================
// STORE / LOCAL STATE
// =======================

class TodoStore extends ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => List.unmodifiable(_todos);

  int get totalCount => _todos.length;

  int get completedCount => _todos.where((todo) => todo.completed).length;

  void addTodo(String name) {
    final todo = Todo(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      completed: false,
    );

    _todos.add(todo);
    notifyListeners();
  }

  void updateTodo(String id, String name) {
    final index = _todos.indexWhere((todo) => todo.id == id);

    if (index == -1) return;

    _todos[index].name = name;
    notifyListeners();
  }

  void deleteTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }

  void toggleTodo(String id, bool value) {
    final index = _todos.indexWhere((todo) => todo.id == id);

    if (index == -1) return;

    _todos[index].completed = value;
    notifyListeners();
  }

  void clearCompleted() {
    _todos.removeWhere((todo) => todo.completed);
    notifyListeners();
  }
}

// =======================
// BUILT-IN PROVIDER
// =======================

class TodoProvider extends InheritedNotifier<TodoStore> {
  const TodoProvider({
    super.key,
    required TodoStore super.notifier,
    required super.child,
  });

  static TodoStore watch(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<TodoProvider>();

    assert(provider != null, 'TodoProvider not found');

    return provider!.notifier!;
  }

  static TodoStore read(BuildContext context) {
    final element =
        context.getElementForInheritedWidgetOfExactType<TodoProvider>();

    final provider = element?.widget as TodoProvider?;

    assert(provider != null, 'TodoProvider not found');

    return provider!.notifier!;
  }
}

// =======================
// APP
// =======================

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
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      home: const TodoPage(),
    );
  }
}

// =======================
// PAGE
// =======================

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  String? _editingTodoId;

  bool get isEditing => _editingTodoId != null;

  void _saveTodo() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) return;

    final text = _controller.text.trim();
    final store = TodoProvider.read(context);

    if (isEditing) {
      store.updateTodo(_editingTodoId!, text);
    } else {
      store.addTodo(text);
    }

    _resetForm();
  }

  void _startEdit(Todo todo) {
    setState(() {
      _editingTodoId = todo.id;
      _controller.text = todo.name;
    });
  }

  void _resetForm() {
    setState(() {
      _editingTodoId = null;
      _controller.clear();
    });
  }

  void _deleteTodo(Todo todo) {
    TodoProvider.read(context).deleteTodo(todo.id);

    if (_editingTodoId == todo.id) {
      _resetForm();
    }
  }

  void _toggleTodo(Todo todo, bool? value) {
    TodoProvider.read(context).toggleTodo(todo.id, value ?? false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = TodoProvider.watch(context);
    final todos = store.todos;

    return Scaffold(
      backgroundColor: const Color(0xfff4f6fb),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _Header(),

              const SizedBox(height: 24),

              _StatsCard(
                completed: store.completedCount,
                total: store.totalCount,
              ),

              const SizedBox(height: 20),

              _TodoForm(
                formKey: _formKey,
                controller: _controller,
                isEditing: isEditing,
                onSubmit: _saveTodo,
                onCancel: _resetForm,
              ),

              const SizedBox(height: 20),

              Expanded(
                child: todos.isEmpty
                    ? const _EmptyState()
                    : ListView.separated(
                        itemCount: todos.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final todo = todos[index];

                          return _TodoTile(
                            todo: todo,
                            onToggle: (value) => _toggleTodo(todo, value),
                            onEdit: () => _startEdit(todo),
                            onDelete: () => _deleteTodo(todo),
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

// =======================
// UI COMPONENTS
// =======================

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class _StatsCard extends StatelessWidget {
  final int completed;
  final int total;

  const _StatsCard({
    required this.completed,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final percent = total == 0 ? 0 : ((completed / total) * 100).round();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.indigo, Colors.deepPurple],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$completed of $total tasks completed',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$percent% complete',
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

class _TodoForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final bool isEditing;
  final VoidCallback onSubmit;
  final VoidCallback onCancel;

  const _TodoForm({
    required this.formKey,
    required this.controller,
    required this.isEditing,
    required this.onSubmit,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.all(12),
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
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => onSubmit(),
              decoration: InputDecoration(
                hintText: isEditing ? 'Update task...' : 'Add a new task...',
              ),
              validator: (value) {
                final text = value?.trim() ?? '';

                if (text.isEmpty) {
                  return 'Task name is required';
                }

                if (text.length < 3) {
                  return 'Task name must be at least 3 characters';
                }

                return null;
              },
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                if (isEditing)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: onCancel,
                      child: const Text('Cancel'),
                    ),
                  ),
                if (isEditing) const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onSubmit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                    ),
                    child: Text(isEditing ? 'Save Changes' : 'Add Task'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TodoTile extends StatelessWidget {
  final Todo todo;
  final ValueChanged<bool?> onToggle;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _TodoTile({
    required this.todo,
    required this.onToggle,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(todo.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDelete(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Icon(Icons.delete_rounded, color: Colors.white),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
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
              onChanged: onToggle,
            ),
            Expanded(
              child: Text(
                todo.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  decoration:
                      todo.completed ? TextDecoration.lineThrough : null,
                  color: todo.completed ? Colors.grey : Colors.black87,
                ),
              ),
            ),
            IconButton(
              onPressed: onEdit,
              icon: const Icon(
                Icons.edit_rounded,
                color: Colors.indigo,
              ),
            ),
            IconButton(
              onPressed: onDelete,
              icon: const Icon(
                Icons.delete_rounded,
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No tasks yet.\nAdd your first task above.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
      ),
    );
  }
}