class TodoModel {
  final String text;
  final DateTime? deadline;
  final bool done;

  TodoModel({
    required this.text,
    this.deadline,
    this.done = false,
  });

  TodoModel copyWith({
    String? text,
    DateTime? deadline,
    bool? done,
  }) {
    return TodoModel(
      text: text ?? this.text,
      deadline: deadline ?? this.deadline,
      done: done ?? this.done,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoModel &&
          runtimeType == other.runtimeType &&
          text == other.text &&
          deadline == other.deadline &&
          done == other.done;

  @override
  int get hashCode => text.hashCode ^ deadline.hashCode ^ done.hashCode;
}
