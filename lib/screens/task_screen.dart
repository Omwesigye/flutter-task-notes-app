import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Task / Note")),
      body: const Center(
        child: Text(
          "This is Screen 2 (Add Task Page)",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
