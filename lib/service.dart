import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:todo/model/model.dart';

/*abstract class TodoRepo {
  Future<List<Todo>> getTodoList();
}

class TodoService implements TodoRepo {
  static const _baseUrl = 'https://jsonplaceholder.typicode.com/todos';
  static const String _GET_TODO = '/todo';

  @override
  Future<List<Todo>> getTodoList() async {
    Uri uri = Uri.https(_baseUrl, _GET_TODO);
    Response response = await http.get(uri);
    List<Todo> todo = todoFromJson(reponse.body);
    return todo;
  }
}*/
