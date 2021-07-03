class Todo {
  int id, date;
  String taskName;

  setDate() {
    DateTime now = DateTime.now();
    String ds = now.year.toString() +
        now.month.toString() +
        now.day.toString() +
        now.hour.toString() +
        now.minute.toString();

    date = int.parse(ds);
  }

  Todo();

  Todo.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    date = map['date'];
    taskName = map['taskName'];
  }

  toMap() {
    return <String, dynamic>{
      'id': id,
      'date': date,
      'taskName': taskName,
    };
  }
}
