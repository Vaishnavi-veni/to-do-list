import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_project/controller/task_controller.dart';

// import '../controller/task_controller.dart';

class AddTaskWidget extends StatelessWidget {
  final TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: taskController,
            decoration: InputDecoration(hintText: 'Enter task title'),
          ),
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            if (taskController.text.trim().isNotEmpty) {
              Get.find<TaskController>().addTask(taskController.text.trim());
              taskController.clear();
            }
          },
        ),
      ],
    );
  }
}
