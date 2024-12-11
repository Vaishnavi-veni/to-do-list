import 'package:flutter/material.dart';
import '../model/task_model.dart';

class TaskItemWidget extends StatelessWidget {
  final TaskModel task;
  final VoidCallback onToggle;

  const TaskItemWidget({
    Key? key,
    required this.task,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
        title: Text(
          task.title,
          style: TextStyle(
            fontSize: 16,
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
            color: task.isCompleted ? Colors.grey : Colors.black,
          ),
        ),
        trailing: Checkbox(
          value: task.isCompleted,
          activeColor: Colors.amber,
          onChanged: (_) => onToggle(),
        ),
      ),
    );
  }
}
