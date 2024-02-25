import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/components/task_list.dart';
import 'package:todoey/components/todo_format.dart';

class TodoList extends StatefulWidget {
  const TodoList({
    super.key,
  });

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TaskList>(context, listen: false).loadDatabase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskList>(builder: (context, taskData, child) {
      return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: taskData.taskCount,
          itemBuilder: (context, index) {
            return TodoFormat(
              deleteTask: () {
                taskData.removeTask(taskData.tasks[index]);
                taskData.saveDatabase();
                Navigator.pop(context);
              },
              taskTitle: taskData.tasks[index].name,
              taskDescription: taskData.tasks[index].description,
              isDone: taskData.tasks[index].isDone,
              toggleCheckboxState: (checkboxState) {
                taskData.updateTask(taskData.tasks[index]);
                taskData.saveDatabase();
              },
            );
          });
    });
  }
}
