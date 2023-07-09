import 'package:fittin_todo/app.dart';
import 'package:fittin_todo/data/todo_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await TodoRepository().init();

  runApp(
    DevicePreview(
      enabled:  kIsWeb,
      builder: (context) => const TodoApp(), // Wrap your app
    ),
  );
}
