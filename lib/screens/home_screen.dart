import 'package:flutter/material.dart';
import 'package:task_notes_manager/screens/task_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    List<Map<String, String>> sampleTasks = [
      {"title": "Buy groceries", "description": "Milk, Bread, Eggs"},
      {"title": "Finish assignment", "description": "Flutter JSON & Database"},
      {"title": "Call friend", "description": "Check how they're doing"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Task Notes Manager", style: TextStyle(color: Colors.white))),
      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "My Tasks & Notes",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),

          
          Expanded(
            child: ListView.builder(
              itemCount: sampleTasks.length,
              itemBuilder: (context, index) {
                final item = sampleTasks[index];
                return ListTile(
                  title: Text(item["title"]!),
                  subtitle: Text(item["description"]!),
                  leading: const Icon(Icons.note_alt),
                  trailing: const Icon(Icons.arrow_forward_ios),
                );
              },
            ),
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTaskScreen()),
          );
        },
      ),
    );
  }
}
