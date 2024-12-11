import 'package:flutter/material.dart';
import 'package:to_do_list_project/screen/todo_list_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
