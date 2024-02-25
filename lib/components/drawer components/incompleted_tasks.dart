import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/components/task_list.dart';

class IncompletedTasks extends StatelessWidget {
  const IncompletedTasks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskList>(builder: (context, taskData, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey[50],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListTile(
            title: Row(
              children: [
                Text('Incomplete Tasks - '),
                Text(
                  '${taskData.incompleteTaskCount}',
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Incomplete Tasks'),
                      content: Container(
                        height: 300,
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: taskData.incompleteTasks.isNotEmpty
                              ? Column(
                                  children:
                                      taskData.incompleteTasks.map((task) {
                                    return ListTile(
                                      title: Text(task.name),
                                      subtitle: Text(task.description),
                                    );
                                  }).toList(),
                                )
                              : Text('All tasks are completed!\nYay...!'),
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Thanks!'),
                        ),
                      ],
                    );
                  });
            },
          ),
        ),
      );
    });
  }
}
