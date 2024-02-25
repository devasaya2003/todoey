import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/components/task_list.dart';

class CompletedTasks extends StatelessWidget {
  const CompletedTasks({
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
                Text('Completed Tasks - '),
                Text(
                  '${taskData.completedTaskCount}',
                  style: const TextStyle(
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Completed Tasks'),
                      content: Container(
                        height: 300,
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: taskData.completedTasks.isNotEmpty
                              ? Column(
                                  children: taskData.completedTasks.map((task) {
                                    return ListTile(
                                      title: Text(task.name),
                                      subtitle: Text(task.description),
                                    );
                                  }).toList(),
                                )
                              : Text('No tasks are completed yet!\nYou can do it...!'),
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
