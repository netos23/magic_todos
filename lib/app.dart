import 'package:fittin_todo/pages/todo_list_page/todo_list_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        useMaterial3: true,

        textTheme: TextTheme(
          headlineSmall: GoogleFonts.montserrat(
            fontSize: 24,
            height: 32 / 24,
            fontWeight: FontWeight.bold,
          )
        )
      ),
      home: const TodoListPage(),
    );
  }
}

