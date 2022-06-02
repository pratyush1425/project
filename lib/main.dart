// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/pages/attendance.dart';
import 'package:project/pages/events.dart';
import 'package:project/pages/home.dart';
import 'package:project/pages/login.dart';
import 'package:project/pages/results.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Project',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => Home(name: "again"),
        '/event': (context) => Events(),
        '/attendance': (context) => Attendance(),
        '/results': (context) => Results(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}


//Changes
