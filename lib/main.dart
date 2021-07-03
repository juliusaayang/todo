import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/screens/create_task.dart';
import 'package:todo/screens/task.dart';


void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.poppinsTextTheme()
      ),
      home: TaskScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/create_page': (context) => CreateTaskScreen(),
      },
    );
  }
}

