import 'package:to_do_app/data/entity/todos.dart';
import 'package:to_do_app/data/sqlite/database.dart';

class TodoDaoRepository {
  Future<void> saveTask(String task) async {
    var db = await DatabaseConnection.dbConnection();
    var datas = Map<String, dynamic>();
    datas["task"] = task;
    db.insert("todos", datas);
  }

  Future<void> updateTask(int id, String task) async {
    var db = await DatabaseConnection.dbConnection();
    var datas = Map<String, dynamic>();
    datas["task"] = task;
    await db.update("todos", datas, where: "id=?", whereArgs: [id]);
  }

  Future<List<Todos>> getTodos() async {
    var db = await DatabaseConnection.dbConnection();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM todos");
    return List.generate(maps.length, (index) {
      var row = maps[index];
      return Todos(id: row["id"], task: row["task"]);
    });
  }

  Future<List<Todos>> searchTask(String searchText) async {
    var db = await DatabaseConnection.dbConnection();
    List<Map<String, dynamic>> maps = await db
        .rawQuery("SELECT * FROM todos WHERE task LIKE '%$searchText%'");
    return List.generate(maps.length, (index) {
      var row = maps[index];
      return Todos(id: row["id"], task: row["task"]);
    });
  }

  Future<void> deleteTask(int id) async {
    var db = await DatabaseConnection.dbConnection();
    db.delete("todos", where: "id=?", whereArgs: [id]);
  }
}
