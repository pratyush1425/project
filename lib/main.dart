// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/pages/attendance_page/attendance.dart';
import 'package:project/pages/courses_page/courses.dart';
import 'package:project/pages/events_page/events.dart';
import 'package:project/pages/home_page/home.dart';
import 'package:project/pages/initial_pages/initial_page.dart';
import 'package:project/pages/initial_pages/sign_in.dart';
import 'package:project/pages/initial_pages/sign_up.dart';
import 'package:project/pages/payments_page/payments.dart';
import 'package:project/pages/profile_page/profile.dart';
import 'package:project/pages/queries_page/queries.dart';
import 'package:project/pages/results_page/results.dart';

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
        '/': (context) => InitialPage(),
        '/signup': (context) => SignUpPage(),
        '/signin': (context) => SignInPage(),
        '/home': (context) => Home(name: "again"),
        '/event': (context) => Events(),
        '/attendance': (context) => Attendance(),
        '/results': (context) => Results(),
        '/profile': (context) => Profile(),
        '/courses': (context) => Courses(),
        '/payments': (context) => Payments(),
        '/queries': (context) => Queries(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
