import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/model/todo.dart';

class CreateTaskScreen extends StatefulWidget {
  final Todo todo;
  CreateTaskScreen({
    this.todo,
  });

  @override
  _CreateTaskScreenState createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  bool remindMe = true;
  TextEditingController _taskName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.grey[800],
        ),
        title: Text("aasdas"),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
          30,
          30,
          30,
          5,
        ),
        child: ListView(
          children: [
            Text(
              "Create New Task",
              style: TextStyle(
                  fontSize: 50,
                  height: 1.2,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[800]),
            ),

            
            Spacer(),

            

            TextField(
              controller: _taskName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.grey[800],
              ),
              cursorColor: Colors.orangeAccent,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey[100])),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey[100])),
                hintText: "Task Name",
                hintStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[400],
                ),
              ),
            ),

            SizedBox(
              height: 30,
            ),

            
            Container(
              child: Row(
                children: [
                  
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(255, 240, 240, 1)),
                    padding: const EdgeInsets.all(16),
                    child: Icon(
                      Icons.calendar_today,
                      color: Colors.redAccent,
                    ),
                  ),

                  
                  SizedBox(
                    width: 24,
                  ),

                
                  Text(
                    "Friday 28, November",
                    style: TextStyle(
                        fontSize: 18,
                        height: 1.2,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[700]),
                  )
                ],
              ),
            ),

            
            SizedBox(
              height: 16,
            ),

            
            Container(
              child: Row(
                children: [
            
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(255, 250, 240, 1)),
                    padding: const EdgeInsets.all(16),
                    child: Icon(
                      Icons.alarm,
                      color: Colors.orangeAccent,
                    ),
                  ),

                  
                  SizedBox(
                    width: 24,
                  ),

      
                  Text(
                    "1:00 - 3:00 PM",
                    style: TextStyle(
                        fontSize: 18,
                        height: 1.2,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[700]),
                  )
                ],
              ),
            ),

           
            SizedBox(
              height: 30,
            ),

            
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blueGrey[100],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
            
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(255, 250, 240, 1)),
                    padding: const EdgeInsets.all(16),
                    child: Icon(
                      Icons.web_asset,
                      color: Colors.orangeAccent,
                    ),
                  ),

            
                  SizedBox(
                    width: 24,
                  ),

                
                  Text(
                    "Work",
                    style: TextStyle(
                        fontSize: 18,
                        height: 1.2,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[700]),
                  ),

                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {},
                  )
                ],
              ),
            ),

            
            SizedBox(
              height: 16,
            ),

           
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blueGrey[100],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
              
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(240, 235, 255, 1)),
                    padding: const EdgeInsets.all(16),
                    child: Icon(
                      Icons.alarm_on,
                      color: Colors.purpleAccent[100],
                    ),
                  ),

                
                  SizedBox(
                    width: 24,
                  ),

                
                  Text(
                    "Remind me",
                    style: TextStyle(
                        fontSize: 18,
                        height: 1.2,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[700]),
                  ),

                  Spacer(),
                  Switch(
                    onChanged: (value) {
                      setState(() {
                        remindMe = value;
                      });
                    },
                    value: remindMe,
                    activeColor: Colors.lightBlueAccent,
                  )
                ],
              ),
            ),

            SizedBox(
              height: 30,
            ),

            
            Container(
              width: double.infinity,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                color: Colors.orangeAccent,
                child: Text(
                  "CREATE TASK",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  if (_taskName.text != '') {
                    widget.todo.taskName = _taskName.text;
                  }
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
