import 'package:device_preview/device_preview.dart';
import 'package:fittin_todo/assets/extra_colors.dart';
import 'package:fittin_todo/data/todo_repository.dart';
import 'package:fittin_todo/pages/todo_list_page/todo_list_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      themeMode: ThemeMode.light,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFFF9900),
            primary: const Color(0xFFFF9900),
            secondary: const Color(0xFF45B443),
            background: const Color(0xFFEDEDED),
            error: const Color(0xFFF85535),
            surface: Colors.white,
          ),
          textTheme: TextTheme(
            headlineSmall: GoogleFonts.montserrat(
              fontSize: 24,
              height: 32 / 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          extensions: const [
            ExtraColors(
              onBackgroundVariant: Color(0xFFAEAEAE),
            ),
          ]),
      home: TodoListPage(
        todoRepository: TodoRepository(),
      ),
    );
  }
}
