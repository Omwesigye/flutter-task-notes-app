import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_notes_manager/screens/task_screen.dart';
import 'package:task_notes_manager/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Hardcoded sample tasks for now (will later be replaced with SQFLITE data)
  List<Map<String, String>> sampleTasks = [
    {"title": "Buy groceries", "description": "Milk, Bread, Eggs"},
    {"title": "Finish assignment", "description": "Flutter JSON & Database"},
    {"title": "Call friend", "description": "Check how they're doing"},
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Notes Manager"),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Theme toggle switch
          SwitchListTile(
            title: const Text("Dark Theme"),
            value: themeProvider.isDark,
            onChanged: (value) {
              themeProvider.toggleTheme(value);
            },
          ),

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
          ),
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
