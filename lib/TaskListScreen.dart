import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_app/CreateTaskScreen.dart';
import 'package:task_app/Task.dart';
import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;

Future<List<Task>> fetchTasks(List<String> arguments) async {
  final user = 'lacj2000';
  final url = Uri.https('task-api-umber.vercel.app', '/api/' + user + '/tasks');
  final response = await http.get(url);
  return compute(parseTasks, response.body);
}

List<Task> parseTasks(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Task>((json) => Task.fromJson(json)).toList();
}

class TaskListScreen extends StatelessWidget {
  final route = '/listTask';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tasks"),
      ),
      body: FutureBuilder<List<Task>>(
        future: fetchTasks(['']),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          if (snapshot.hasData) {
            return TaskList(tasks: snapshot.data as List<Task>);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_circle_rounded),
        onPressed: () => Navigator.pushNamed(context, CreateTaskScreen().route),
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  final List<Task> tasks;

  TaskList({Key? key, required this.tasks}) : super(key: key);

  getIcon(Task task) {
    var icon;
    if (task.status) {
      icon = Icon(Icons.check_box_outline_blank_rounded);
    } else {
      icon = Icon(Icons.radio_button_unchecked);
    }

    return ElevatedButton(
        onPressed: () => print("check " + task.id), child: icon);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: getIcon(tasks[index]),
            title: Text(tasks[index].name),
          );
        });
  }
}
