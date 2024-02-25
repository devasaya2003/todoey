import 'package:flutter/material.dart';
import 'package:todoey/components/drawer%20components/all_tasks.dart';
import 'package:todoey/components/drawer%20components/completed_tasks.dart';
import 'package:todoey/components/drawer%20components/incompleted_tasks.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
            ),
            child: Text(
              'Todoey\nDrawer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
          ),
          const AllTasks(),
          const CompletedTasks(),
          const IncompletedTasks(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.45,
          ),
          
        ],
      ),
    );
  }
}
