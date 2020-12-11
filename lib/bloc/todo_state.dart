part of 'todo_bloc.dart';

@immutable
class TodoState {}

class TodoLoading extends TodoState {}

class TodoLoad extends TodoState {
  TodoLoad(List<TodoModel> todos, {this.todo});

  final List<Todo> todo;
}

class TodoNotLoad extends TodoState {}
