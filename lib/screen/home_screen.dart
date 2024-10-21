import 'package:flutter/material.dart';
import 'package:todoapp/data/provider/todo_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  bool isEdit = false;
  int editIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _editTodoContent(String content, int i) {
    setState(() {
      isEdit = true;
      editIndex = i;
    });
    _controller.text = content;
  }

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Add a new Todo',
                    ),
                  ),
                ),
                !isEdit
                    ? IconButton(
                        onPressed: () {
                          todoProvider.addTodo(_controller.text);
                          _controller.clear();
                        },
                        icon: const Icon(Icons.add),
                      )
                    : IconButton(
                        onPressed: () {
                          todoProvider.editTodo(_controller.text, editIndex);
                          _controller.clear();
                          setState(() {
                            isEdit = false;
                          });
                        },
                        icon: const Icon(Icons.update),
                      )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todoProvider.todos.length,
              itemBuilder: (context, index) {
                final todo = todoProvider.todos[index];
                return ListTile(
                  title: Text(todo.title),
                  trailing: SizedBox(
                    width: 120,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            todoProvider.toggleTodoStatus(index);
                          },
                          icon: Icon(
                            todo.isDone ? Icons.check_circle : Icons.circle,
                            color: todo.isDone ? Colors.green : Colors.grey,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _editTodoContent(todo.title, index);
                          },
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            todoProvider.removeTodo(index);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
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
