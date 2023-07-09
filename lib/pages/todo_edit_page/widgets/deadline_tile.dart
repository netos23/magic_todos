import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DeadlineTile extends StatelessWidget {
  const DeadlineTile({
    super.key,
    required this.deadline,
    required this.onDeadlineUpdate,
  });

  final DateTime? deadline;
  final ValueSetter<DateTime?> onDeadlineUpdate;

  @override
  Widget build(BuildContext context) {
    final deadline = this.deadline;
    return CheckboxListTile(
      contentPadding: EdgeInsets.zero,
      value: deadline != null,
      onChanged: (value) async {
        final hasDeadline = value ?? false;
        if (hasDeadline) {
          onDeadlineUpdate(null);
        }

        final nextDeadline = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(
            const Duration(days: 1000),
          ),
        );

        if (nextDeadline != null) {
          onDeadlineUpdate(nextDeadline);
        }
      },
      title: const Text('Дедлайн'),
      subtitle: deadline != null
          ? Text(
              DateFormat.yMd().format(deadline),
            )
          : null,
    );
  }
}
