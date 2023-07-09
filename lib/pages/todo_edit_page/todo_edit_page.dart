import 'package:fittin_todo/models/todo_model.dart';
import 'package:fittin_todo/pages/todo_edit_page/widgets/deadline_tile.dart';
import 'package:fittin_todo/pages/todo_edit_page/widgets/input_card.dart';
import 'package:fittin_todo/pages/todo_edit_page/widgets/remove_tile.dart';
import 'package:flutter/material.dart';

class TodoEditPage extends StatefulWidget {
  const TodoEditPage({
    super.key,
    this.todo,
  });

  final TodoModel? todo;

  @override
  State<TodoEditPage> createState() => _TodoEditPageState();
}

class _TodoEditPageState extends State<TodoEditPage> {
  final TextEditingController _controller = TextEditingController();
  DateTime? _deadline;

  @override
  void initState() {
    super.initState();
    _syncTodo();
  }

  void _syncTodo() {
    _controller.text = widget.todo?.text ?? '';
    _deadline = widget.todo?.deadline;
  }

  @override
  void didUpdateWidget(covariant TodoEditPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncTodo();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.background,
        leading: IconButton(
          onPressed: () => Navigator.of(context).maybePop(
            widget.todo,
          ),
          icon: const Icon(Icons.close),
        ),
        actions: [
          TextButton(
            onPressed: () {
              final todo = TodoModel(
                text: _controller.text,
                deadline: _deadline,
                done: widget.todo?.done ?? false,
              );
              Navigator.of(context).maybePop(todo);
            },
            child: const Text('СОХРАНИТЬ'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        children: [
          InputCard(
            controller: _controller,
          ),
          DeadlineTile(
            deadline: _deadline,
            onDeadlineUpdate: (deadline) {
              setState(() {
                _deadline = null;
              });
            },
          ),
          if (widget.todo != null) const Divider(),
          if (widget.todo != null) const RemoveTile(),
        ],
      ),
    );
  }
}
