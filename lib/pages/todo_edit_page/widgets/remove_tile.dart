import 'package:flutter/material.dart';

class RemoveTile extends StatelessWidget {
  const RemoveTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final styles = Theme.of(context).textTheme;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        Icons.delete,
        color: colors.error,
      ),
      onTap: () => Navigator.of(context).pop(),
      title: Text(
        'Удалить',
        style: styles.bodyLarge?.copyWith(
          color: colors.error,
        ),
      ),
    );
  }
}
