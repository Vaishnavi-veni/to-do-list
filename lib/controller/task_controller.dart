import 'package:get/get.dart';
import '../model/task_model.dart';

class TaskController extends GetxController {
  var tasks = <TaskModel>[].obs;

  void addTask(String title) {
    tasks.add(TaskModel(title: title));
    print("Task Added: $title");
    print("Current Tasks: ${tasks.length}");
  }

  void toggleCompletion(int index) {
    tasks[index].isCompleted = !tasks[index].isCompleted;
    tasks.refresh(); // Notifies GetX to update UI
  }
}
