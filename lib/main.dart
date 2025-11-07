import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_notes_manager/screens/home_screen.dart';
import 'package:task_notes_manager/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Notes Manager',
      theme: themeProvider.isDark ? ThemeData.dark() : ThemeData.light(),
      home: const HomeScreen(),
    );
  }
}
