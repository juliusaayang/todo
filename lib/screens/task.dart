import 'package:flutter/cupertino.dart';f
import 'package:flutter/material.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/screens/create_task.dart';
import 'package:todo/service/db.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Todo> todos;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          top: 10,
        ),
        child: Row(
          children: [
            
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ///Text
                        Text(
                          "Todo",
                          style: TextStyle(
                            fontSize: 50,
                            height: 1.2,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey[800],
                          ),
                        ),

                        Spacer(),

                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {},
                        )
                      ],
                    ),

                    
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          Todo todo = todos[index];

                          
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/create_page',
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueGrey[100]),
                                color: index == 1
                                    ? Colors.orangeAccent
                                    : Colors.transparent,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          todo.taskName,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: index == 1
                                                ? Colors.white
                                                : Colors.grey[800],
                                          ),
                                        ),
                                      ),

                                      

                                      SizedBox(
                                        width: 4,
                                      ),

                                      index == 1
                                          ? Icon(
                                              Icons.check_circle,
                                              color: Colors.white,
                                            )
                                          : Container()
                                    ],
                                  ),

                                 
                                  SizedBox(
                                    height: 8,
                                  ),

                                  
                                  Row(
                                    children: [
                                      Text(
                                        "21 JUN 2021",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: index == 1
                                                ? Colors.white70
                                                : Colors.grey[500]),
                                      ),
                                      Spacer(),
                                      index == 1
                                          ? Text(
                                              "COMPLETED",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 12,
                                                  color: Colors.white),
                                            )
                                          : Text(
                                              "11:00 - 3:00",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  color: index == 1
                                                      ? Colors.white70
                                                      : Colors.grey[500]),
                                            ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => Divider(
                          height: 16,
                          color: Colors.transparent,
                        ),
                        itemCount: todos.length,
                      ),
                    ),

                    
                    SizedBox(
                      height: 16,
                    ),

                    
                    Container(
                      width: double.infinity,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        color: Colors.orangeAccent,
                        child: Text(
                          "ADD NEW TASK",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateTaskScreen(),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
