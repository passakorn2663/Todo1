import 'dart:async';
//event,state-> new state -> update UI
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo/model/model.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/provider/storage.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoLoading());

  @override
  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is Load) {
      final todos = await FileStorage().loadTodos();
      yield TodoLoad(todos);
    } else if (event is Add) {
    } else if (event is Update) {
    } else if (event is Delete) {}
  }
}
