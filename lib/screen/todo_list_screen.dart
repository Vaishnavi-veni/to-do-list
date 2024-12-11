import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_project/widget/add_task.dart';
import 'package:to_do_list_project/widget/task_item.dart';
import '../controller/task_controller.dart';

class TodoListScreen extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('To-Do List', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Color(0xfff5e6ae),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add Task Input
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AddTaskWidget(),
          ),
          // Pending Tasks Section
          Obx(() {
            final pendingTasks = taskController.tasks
                .where((task) => !task.isCompleted)
                .toList();
            final completedTasks =
                taskController.tasks.where((task) => task.isCompleted).toList();

            return Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  // Pending Tasks Header
                  if (pendingTasks.isNotEmpty)
                    SectionHeader(title: 'Pending Tasks'),
                  ...pendingTasks.map((task) {
                    final index = taskController.tasks.indexOf(task);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: TaskItemWidget(
                        task: task,
                        onToggle: () => taskController.toggleCompletion(index),
                      ),
                    );
                  }).toList(),
                  // Completed Tasks Header
                  if (completedTasks.isNotEmpty)
                    SectionHeader(title: 'Completed Tasks'),
                  ...completedTasks.map((task) {
                    final index = taskController.tasks.indexOf(task);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: TaskItemWidget(
                        task: task,
                        onToggle: () => taskController.toggleCompletion(index),
                      ),
                    );
                  }).toList(),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

// Section Header Widget
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
