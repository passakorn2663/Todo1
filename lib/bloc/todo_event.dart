part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {
  const TodoEvent();
}

class Load extends TodoEvent {}

class Add extends TodoEvent {
  final Todo todo;

  const Add(this.todo);
}

class Update extends TodoEvent {
  final Todo todo;

  const Update(this.todo);
}

class Delete extends TodoEvent {
  final Todo todo;

  const Delete(this.todo);
}
