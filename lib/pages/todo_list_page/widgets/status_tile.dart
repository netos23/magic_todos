import 'package:fittin_todo/assets/extra_colors.dart';
import 'package:flutter/material.dart';

class StatusTile extends StatelessWidget {
  final int done;

  final IconData icon;
  final VoidCallback switchShowDone;

  const StatusTile({
    super.key,
    required this.done,
    required this.icon,
    required this.switchShowDone,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final styles = Theme.of(context).textTheme;
    final extraColors = Theme.of(context).extension<ExtraColors>();

    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        'Выполнено - $done',
        style: styles.bodyLarge?.copyWith(
          color: extraColors?.onBackgroundVariant,
        ),
      ),
      trailing: IconButton(
        icon: Icon(
          icon,
          color: colors.primary,
        ),
        onPressed: switchShowDone,
      ),
    );
  }
}
