import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/todo_bloc.dart';


class TodosScreen extends StatelessWidget {
  const TodosScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todosBloc = BlocProvider.of<TodoBloc>(context);
    return Scaffold(
        appBar: AppBar(
            title: Text(
          'Todo App',
        )),
        body: BlocBuilder(
            cubit : todosBloc,
            builder: (BuildContext context, TodoState state) {
                                         
                final todos = state.todos;
                return ListView.builder(                                  // --> ใช้ ListView.builder ให้สร้าง list card ขึ้นมา
                  key: Key('__ListTodos__'),
                  itemCount: todos.length,
                  itemBuilder: (BuildContext context, int index) {
                    final todo = todos[index];
                    return Card(                                          // --> เลือกใช้ card แสดงข้อมูล todo แต่ละอัน
                      elevation: 8.0,
                      child: InkWell(                                     // --> ใส่ InkWell ครอบ เมื่่อกดปุ่มจะได้มี ripple effect
                        onTap: () =>                                      // --> เมื่อกดไปที่ card ก็จะส่งไปหน้า DetailAddScreen แบบมีรหัส id และอยู่ในสถานะ ไม่ได้แก้ไขข้อมูล
                            Navigator.of(context).push(CupertinoPageRoute(
                                builder: (_) => DetailAddScreen(
                                      id: todo.id,
                                      isEditing: false,
                                    ))),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: <Widget>[
                              GestureDetector(                                      // --> ที่ด้านซ้ายของ card จะมีปุ่มที่ติ๊กบอกความ complete
                                onTap: () => todosBloc.add(Update(        // --> เมื่อกด เราจะทำการเรียก event UpdateTodos 
                                    todo.copyWith(complete: !todo.complete))),      // --> ใช้ copyWith เพื่อไม่ทำให้ข้อมูลเก่าถูกกลายพันธุ์
                                child: todo.complete == false
                                    ? Icon(Icons.check_box_outline_blank)
                                    : Icon(Icons.check_box),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Text('${todo.title}'),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            }),
        floatingActionButton: FloatingActionButton(                               // --> ปุ่มเพิ่ม todo ใหม่ จะลอยอยู่บนด้านล่างซ้าย
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(CupertinoPageRoute(                        // --> เมื่อกดไปที่ card ก็จะส่งไปหน้า DetailAddScreen แบบ ไม่มี รหัส id และอยู่ในสถานะ แก้ไขข้อมูล
                                builder: (_) => DetailAddScreen(
                                      isEditing: true,
                                    )));
          },
        ));
  }
}
