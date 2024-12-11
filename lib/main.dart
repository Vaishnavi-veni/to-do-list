import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_do_list_project/screen/todo_list_screen.dart';

Future<void> main() async {
    await GetStorage.init();

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

