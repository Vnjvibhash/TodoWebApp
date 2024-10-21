import 'package:flutter/material.dart';
import 'package:todoapp/data/model/todo.dart';

class TodoProvider with ChangeNotifier {
  final List<Todo> _todo = [];

  List<Todo> get todos => _todo;

  void addTodo(String title) {
    _todo.add(Todo(title: title));
    notifyListeners();
  }

  void toggleTodoStatus(int index) {
    _todo[index].isDone = !_todo[index].isDone;
    notifyListeners();
  }

  void removeTodo(int index) {
    _todo.removeAt(index);
    notifyListeners();
  }

  void editTodo(String title, int index) {
    _todo[index].title = title;
    notifyListeners();
  }
}
