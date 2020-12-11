import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo/screens/todo_screen.dart';

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
        title: Text ('Todo App')
      ),
    );
    body: BlocBuilder(
      bloc: todosBloc,
      builder: (BuildContext context,TodoListState state) {
        final todos = state.todos;
        return ListView.builder(
          itemCount: todos.length,

        );
      },
    )
  }
}
