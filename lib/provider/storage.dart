import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:todo/model/todo.dart';

class FileStorage {
  final String tag = '__todos__';

  Future<File> _getLocalFile() async {
    final dir = await getDirectory();

    return File('${dir.path}/ArchSampleStorage__$tag.json');
  }

  Future<List<TodoModel>> loadTodos() async {
    try {
      final file = await _getLocalFile(); // ดึงไฟล์ todos มา
      final string = await file.readAsString();
      final json = await jsonDecode(string);
      final todos = TodoList.fromJson(json);
      return todos.todos;
    } catch (e) {
      print('not init');
      return TodoList([
        TodoModel(
          title: 'Welcome to Simple Todo',
        )
      ]).todos;
    }
  }

  Future<File> saveTodos(List<TodoModel> todos) async {
    final file = await _getLocalFile();
    TodoList temp = TodoList(todos);
    return file.writeAsString(jsonEncode(temp));
  } //เชื่อมที่อยู่กับชื่อไฟล์ ่json และส่งข้อมูลเป็นไฟล์ไป
}

Future<Directory> getDirectory() async {
  Directory path = await getApplicationDocumentsDirectory();
  if (path == null) {
    return null;
  }
  return path;
} // เมื่อเรียนกใช้ฟังก์ชัน จะได้path
