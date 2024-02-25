import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/components/my_drawer.dart';
import 'package:todoey/components/task_list.dart';
import 'package:todoey/components/todo_list.dart';
import 'package:todoey/pages/add_task_page.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskList>(
      builder: (context, taskData, child) {
        return Scaffold(
          drawer: MyDrawer(),
          backgroundColor: Colors.lightBlueAccent,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddTaskScreen(
                      addTaskCallback: (newTaskTitle, newTaskDescription) {
                        taskData.addTask(newTaskTitle, newTaskDescription);
                        taskData.saveDatabase();
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 60, left: 30, right: 30, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Builder(builder: (BuildContext context) {
                      return InkWell(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25,
                          child: Icon(Icons.list,
                              size: 30, color: Colors.lightBlueAccent),
                        ),
                      );
                    }),
                    const SizedBox(height: 20),
                    const Text(
                      'Todoey',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '${taskData.taskCount} Tasks | ${taskData.completedTaskCount} Completed | ${taskData.incompleteTaskCount} Incomplete',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    const SizedBox(height: 19),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: const TodoList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
