import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/model/todo.dart';

class DB {
  static Database _database;
  final String table = 'todos';

  Future<Database> get db async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    var directory = await getDatabasesPath();
    String path = join(directory, 'todo.db');
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database _db, int version) async {
        await _db.execute(
          'CREATE TABLE $table(id INTEGER PRIMARY KEY AUTOINCREMENT, date INTEGER, taskName TEXT)',
        );
      },
    );
    return database;
  }

  Future<void> addTodos(Todo todo) async {
    var database = await db;
    todo.setDate();
    await database.insert(
      table,
      todo.toMap(),
    );
  }

  Future<void> updateTodos(Todo todo) async {
    var database = await db;
    todo.setDate();
    await database.update(
      table,
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  Future<void> deleteTodosk(Todo todo) async {
    var database = await db;
    await database.delete(
      table,
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  Future<List<Todo>> getTodos() async {
    var database = await db;
    List<Map<String, dynamic>> maps = await database.rawQuery(
      'SELECT * FROM $table ORDER BY date DESC',
    );
    List<Todo> todos = [];
    for (Map<String, dynamic> map in maps) {
      todos.add(
        Todo.fromMap(map),
      );
    }
    return todos;
  }

  
}
