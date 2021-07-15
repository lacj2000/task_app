import 'package:flutter/material.dart';
import 'package:task_app/CreateTaskScreen.dart';
import 'package:task_app/TaskListScreen.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: TaskListScreen().route,
    routes: {
      TaskListScreen().route: (context) => TaskListScreen(),
      CreateTaskScreen().route: (context) => CreateTaskScreen(),
    },
  ));
}
