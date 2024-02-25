import 'package:flutter/material.dart';

class TodoFormat extends StatelessWidget {
  final String taskTitle;
  final String taskDescription;
  final bool isDone;
  final ValueChanged<bool?> toggleCheckboxState;
  final Function()? deleteTask;

  const TodoFormat({
    Key? key,
    required this.taskTitle,
    required this.isDone,
    required this.toggleCheckboxState,
    required this.deleteTask,
    required this.taskDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey[50],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          onLongPress: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  title: const Text('Delete Task'),
                  content:
                      const Text('Are you sure you want to delete this task?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: deleteTask,
                      child: const Text('Delete'),
                    ),
                  ],
                );
              },
            );
          },
          title: Text(
            taskTitle,
            style: TextStyle(
              color: isDone ? Colors.grey : Colors.black,
              decoration:
                  isDone ? TextDecoration.lineThrough : TextDecoration.none,
            ),
          ),
          subtitle: Text(
            taskDescription,
            style: TextStyle(
              color: isDone ? Colors.grey : Colors.grey[800],
              decoration:
                  isDone ? TextDecoration.lineThrough : TextDecoration.none,
            ),
          ),
          trailing: Checkbox(
            activeColor: Colors.lightBlueAccent,
            value: isDone,
            onChanged: toggleCheckboxState,
          ),
        ),
      ),
    );
  }
}
