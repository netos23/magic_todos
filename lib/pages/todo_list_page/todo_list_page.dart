import 'package:fittin_todo/data/todo_repository.dart';
import 'package:fittin_todo/models/todo_model.dart';
import 'package:fittin_todo/pages/todo_edit_page/todo_edit_page.dart';
import 'package:fittin_todo/pages/todo_list_page/widgets/todo_list.dart';
import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({
    super.key,
    required this.todoRepository,
  });

  final TodoRepository todoRepository;

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  TodoRepository get todoRepository => widget.todoRepository;
  bool _showDone = true;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    final todos =
        _showDone ? todoRepository.getAll() : todoRepository.getNotDone();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeData.colorScheme.background,
        centerTitle: true,
        title: Text(
          'Мои дела',
          style: themeData.textTheme.headlineSmall?.copyWith(),
        ),
      ),
      body: SafeArea(
        top: false,
        child: TodoList(
          done: todoRepository.countDone(),
          todos: todos,
          showDone: _showDone,
          switchShowDone: () {
            setState(() {
              _showDone = !_showDone;
            });
          },
          onRemove: (todo) {
            setState(() {
              todoRepository.remove(todo);
            });
          },
          onDone: (todo) {
            setState(() {
              todoRepository.save(
                todo.copyWith(
                  done: !todo.done,
                ),
              );
            });
          },
          onEdit: (todo) async {
            final editedTodo = await Navigator.push(
              context,
              MaterialPageRoute<TodoModel?>(
                builder: (_) => TodoEditPage(
                  todo: todo,
                ),
              ),
            );

            if (editedTodo != null && editedTodo != todo) {
              setState(() {
                todoRepository.save(editedTodo);
              });
              return;
            }

            setState(() {
              todoRepository.remove(todo);
            });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final todo = await Navigator.push(
            context,
            MaterialPageRoute<TodoModel?>(
              builder: (_) => const TodoEditPage(),
            ),
          );
          if (todo != null) {
            setState(() {
              todoRepository.save(todo);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
