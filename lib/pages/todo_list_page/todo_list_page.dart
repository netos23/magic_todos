import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Мои дела',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Container(
        color: Colors.red,
        child: Text('test'),
      ),
    );
  }
}
