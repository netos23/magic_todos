import 'package:fittin_todo/models/todo_model.dart';
import 'package:fittin_todo/pages/todo_list_page/widgets/status_tile.dart';
import 'package:fittin_todo/pages/todo_list_page/widgets/todo_tile.dart';
import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  final int done;

  final List<TodoModel> todos;
  final bool showDone;
  final VoidCallback switchShowDone;
  final ValueSetter<TodoModel> onRemove;
  final ValueSetter<TodoModel> onDone;
  final ValueSetter<TodoModel> onEdit;

  const TodoList({
    super.key,
    required this.done,
    required this.todos,
    this.showDone = false,
    required this.switchShowDone,
    required this.onRemove,
    required this.onDone,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: 17,
        vertical: 5,
      ),
      itemCount: todos.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return StatusTile(
            done: done,
            icon: showDone ? Icons.visibility_off : Icons.visibility,
            switchShowDone: switchShowDone,
          );
        }

        final todo = todos[index - 1];

        return TodoTile(
          todo: todo,
          borderRadius: _buildBorderRadius(index, todos.length),
          onDone: onDone,
          onRemove: onRemove,
          onEdit: onEdit,
        );
      },
    );
  }

  BorderRadius _buildBorderRadius(int index, int length) {
    const radius = Radius.circular(20);

    if (length == 1) {
      return const BorderRadius.all(radius);
    }

    if (index == 1) {
      return const BorderRadius.only(
        topLeft: radius,
        topRight: radius,
      );
    }

    if (index == length) {
      return const BorderRadius.only(
        bottomLeft: radius,
        bottomRight: radius,
      );
    }

    return BorderRadius.zero;
  }
}
