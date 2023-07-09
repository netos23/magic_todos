import 'package:fittin_todo/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    required this.todo,
    required this.borderRadius,
    required this.onRemove,
    required this.onDone,
    required this.onEdit,
  });

  final TodoModel todo;
  final BorderRadius borderRadius;

  final ValueSetter<TodoModel> onRemove;
  final ValueSetter<TodoModel> onDone;
  final ValueSetter<TodoModel> onEdit;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final deadline = todo.deadline;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: borderRadius,
      ),
      child: Dismissible(
        background: Container(
          color: colors.secondary,
          child: Icon(
            Icons.done,
            color: colors.surface,
          ),
        ),
        secondaryBackground: Container(
          color: colors.error,
          child: Icon(
            Icons.delete,
            color: colors.surface,
          ),
        ),
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.startToEnd) {
            onDone(todo);
          }

          return direction == DismissDirection.endToStart;
        },
        key: ValueKey<TodoModel>(todo),
        onDismissed: (_) => onRemove(todo),
        child: ListTile(
          contentPadding: const EdgeInsets.only(
            right: 16,
          ),
          leading: Checkbox(
            value: todo.done,
            onChanged: (_) => onDone(todo),
          ),
          onTap: () => onEdit(todo),
          title: Text(
            todo.text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: deadline != null
              ? Text(
                  DateFormat.yMd().format(deadline),
                )
              : null,
        ),
      ),
    );
  }
}
