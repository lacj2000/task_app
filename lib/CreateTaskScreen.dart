import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateTaskScreen extends StatelessWidget {
  final route = '/createTask';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Task"),
      ),
      body: Text('body'),
    );
  }
}
