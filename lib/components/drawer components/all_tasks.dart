import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/components/task_list.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({
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
                Text('All Tasks - '),
                Text(
                  '${taskData.taskCount}',
                  style: const TextStyle(
                      // color: Colors.grey,
                      ),
                ),
              ],
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('All Tasks'),
                      content: Container(
                        height: 300,
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: taskData.tasks.isNotEmpty
                              ? Column(
                                  children: taskData.tasks.map((task) {
                                    return ListTile(
                                      title: Text(task.name),
                                      subtitle: Text(task.description),
                                    );
                                  }).toList(),
                                )
                              : Text('No Tasks'),
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
