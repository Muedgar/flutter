
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: TodoPage(),));
}

class Todo {
    String id;
    String title;
    bool completed;

    Todo({required this.id, required this.title, required this.completed});
}

class TodoPage extends StatefulWidget {
    const TodoPage({super.key});

    @override
    State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
    List<Todo> todos = [
        Todo(id: DateTime.now().toString(), title: 'Cook', completed: false)
    ];

    

    

    @override
    Widget build(BuildContext context) {
        TextEditingController controller = TextEditingController();
void addTodo() {
        setState(() {
            todos.add(Todo(id: DateTime.now().toString(), title: controller.text, completed: false));
        });
    }
        return Scaffold(
            appBar: AppBar(
                title: Text('Todo'),
            ),
            body: Padding(
                padding: EdgeInsets.all(4),
                child: Column(
                    children: [
                        Row(
                            children: [
                                Expanded(
                                child: TextField(controller: controller)
                            ),
                            ElevatedButton(child: Text('Add todo'), onPressed: () => addTodo(),)
                            ],
                        ),
                        Expanded(
                            child: ListView.builder(
                                itemCount: todos.length,
                                itemBuilder:(_, index) {
                                  Todo todo = todos[index];
                                  return ListTile(
                                    title: Text(todo.title),
                                  );
                                },)
                        )
                    ],
                ),
            ),
        );
    }
}