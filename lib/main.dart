

import 'package:flutter/material.dart';

class Todo {
  String id;
  String name;
  String completed;


  Todo({required this.id, required this.name, required this.completed});
}

class TodoPage extends StatefulWidget {
  const TodoPage({super.key})

  State<TodoPage> _createState: State<_TodoPageState()>;
}

class _TodoPageState extends State<TodoPage> {

  TextEditingController controller = TextEditingController();

  List<Todo> todos = [];

  addTodo() {

  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsetsGeometry.all(1.4),
        child: Column(
          children: [
            Row(
          children: [
            TextField(
              controller: controller,
              style: TextStyle(
                color: Color.fromARGB(1, 248, 123, 231)
              ),
              ),
            ElevatedButton(
              onPressed: addTodo(), 
              child: Text('Add todo'),
              style: ButtonStyle(
                backgroundColor: Color.fromARGB(5, 128, 181, 64),
                foregroundColor: Color.fromARGB(255, 0, 0, 0)
              ),)
          ],
        ),
        Column(children: [
          ListView.builder(itemBuilder: () {
            ite
          })
        ],)
          ],)
    ));
  }
}