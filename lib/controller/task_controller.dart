import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../model/task_model.dart';

class TaskController extends GetxController {
  var tasks = <TaskModel>[].obs;
  final storage = GetStorage();
  final String storageKey = 'tasks';

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  void addTask(String title) {
    tasks.add(TaskModel(title: title));
    saveTasks();
  }

  void toggleCompletion(int index) {
    tasks[index].isCompleted = !tasks[index].isCompleted;
    tasks.refresh();
    saveTasks();
  }

  void saveTasks() {
    // Convert tasks to JSON and save in GetStorage
    final tasksJson = tasks.map((task) => task.toJson()).toList();
    storage.write(storageKey, jsonEncode(tasksJson));
  }

  void loadTasks() {
    // Load tasks from GetStorage and populate the tasks list
    final tasksData = storage.read(storageKey);
    if (tasksData != null) {
      final List<dynamic> decodedData = jsonDecode(tasksData);
      tasks.assignAll(
        decodedData.map((json) => TaskModel.fromJson(json)).toList(),
      );
    }
  }
}
