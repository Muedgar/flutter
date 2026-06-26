import 'package:flutter/material.dart';

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

    TextEditingController controller = TextEditingController();

    List<Todo> todos = [
        Todo(completed: true, id: '1', title: 'dkfjs')
    ];

    void addTodo() {

    }

    void toggle(Todo todo, bool? value) {
        setState(() {
            todo.completed = value ?? false;
        });
    }

    @override
    Widget build (BuildContext context) {
        return Column(
            children: [
                Row(
                    children: [
                        TextField(
                    controller: controller
                ),
                ElevatedButton(onPressed: addTodo, child: Text('Add todo'))
                    ],
                ),
                ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (_, index) {
                        final todo = todos[index];

                        return CheckboxListTile(
                            value: todo.completed,
                            onChanged: (value) => toggle(todo, value),
                            title: Text(
                                todo.title,
                                style: TextStyle(
                                    decoration: todo.completed ? TextDecoration.lineThrough : null
                                ) 
                            )
                        );
                    }
                    )
            ],
        );
    }
}