import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:todoey/components/task_list.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallback;

  const AddTaskScreen({super.key, required this.addTaskCallback});

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    String? newTaskDescription;

    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 25),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'Enter task name...',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 20,
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ),
              onChanged: (titleName) {
                newTaskTitle = titleName;
              },
            ),
            const SizedBox(height: 10),
            TextField(
              autofocus: true,
              textAlign: TextAlign.left,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: 'Enter task description...',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 20,
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ),
              onChanged: (description) {
                newTaskDescription = description;
              },
            ),
            const SizedBox(height: 10),
            MaterialButton(
                onPressed: () {
                  if (newTaskTitle == null || newTaskDescription == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Bro, either the title or description is empty...!'),
                        duration: Duration(milliseconds: 1500),
                        behavior: SnackBarBehavior.floating,
                        margin:
                            EdgeInsets.only(bottom: 300, left: 10, right: 10),
                      ),
                    );
                  } else {
                    addTaskCallback(newTaskTitle, newTaskDescription);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.lightBlueAccent,
                  child: const Center(
                      child: Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  )),
                ))
          ],
        ),
      ),
    );
  }
}
