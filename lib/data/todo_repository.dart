import 'dart:convert';

import 'package:fittin_todo/models/todo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

const _storageKey = 'todo_storage';

class TodoRepository {
  static TodoRepository? _instance;

  SharedPreferences? _sharedPreferences;

  final Map<String, TodoModel> _storage = {};

  factory TodoRepository() {
    return _instance ??= TodoRepository._();
  }

  TodoRepository._();

  int countDone() => _storage.values.where((todo) => todo.done).length;

  List<TodoModel> getAll() => _storage.values.toList();

  List<TodoModel> getNotDone() =>
      _storage.values.where((todo) => !todo.done).toList();

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    final data = _sharedPreferences?.getString(_storageKey);

    if (data != null) {
      final json = jsonDecode(data) as Map<String, dynamic>;
      final entries = json.map(
        (key, value) => MapEntry(key, TodoModel.fromJson(value)),
      );
      _storage.addAll(entries);
    }
  }

  TodoModel? remove(TodoModel todoModel) => _storage.remove(todoModel.id);

  TodoModel save(TodoModel todoModel) {
    final todo = todoModel.id == null
        ? todoModel.copyWith(
            id: const Uuid().v4(),
          )
        : todoModel;
    _storage[todo.id!] = todo;
    _save();

    return todo;
  }

  Future<void> _save() async {
    final json = _storage.map((key, value) => MapEntry(key, value.toJson()));
    final data = jsonEncode(json);
    await _sharedPreferences?.setString(_storageKey, data);
  }
}
