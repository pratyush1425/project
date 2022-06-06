// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/firebase_options.dart';
import 'package:project/pages/admin/Attendance/admin_attendance.dart';
import 'package:project/pages/admin/Courses/admin_courses.dart';
import 'package:project/pages/admin/Events/admin_events.dart';
import 'package:project/pages/admin/Profile/admin_profile.dart';
import 'package:project/pages/admin/Queries/admin_queries.dart';
import 'package:project/pages/admin/Results/admin_results.dart';
import 'package:project/pages/initial_pages/admin_sign_in.dart';
import 'package:project/pages/initial_pages/initial_page.dart';
import 'package:project/pages/initial_pages/sign_in.dart';
import 'package:project/pages/initial_pages/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/pages/initial_pages/wrapper.dart';
import 'package:project/pages/user/attendance_page/attendance.dart';
import 'package:project/pages/user/courses_page/courses.dart';
import 'package:project/pages/user/events_page/events.dart';
import 'package:project/pages/user/home_page/home.dart';
import 'package:project/pages/user/payments_page/payments.dart';
import 'package:project/pages/user/profile_page/edit_profile.dart';
import 'package:project/pages/user/profile_page/profile.dart';
import 'package:project/pages/user/queries_page/queries.dart';
import 'package:project/pages/user/results_page/results.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Project',
      initialRoute: 'wrapper',
      routes: {
        'wrapper': (context) => Wrapper(),
        '/': (context) => InitialPage(),
        '/signup': (context) => SignUpPage(),
        '/signin': (context) => SignInPage(),
        '/home': (context) => Home(),
        '/event': (context) => Events(),
        '/attendance': (context) => Attendance(),
        '/results': (context) => Results(),
        '/profile': (context) => Profile(),
        '/edit_profile': (context) => EditProfile(),
        '/courses': (context) => Courses(),
        '/payments': (context) => Payments(),
        '/queries': (context) => Queries(),
        '/admin_signin': (context) => AdminSignInPage(),
        '/admin_home': (context) => Home(),
        '/admin_event': (context) => AdminEvents(),
        '/admin_attendance': (context) => AdminAttendance(),
        '/admin_results': (context) => AdminResults(),
        '/admin_profile': (context) => AdminProfile(),
        '/admin_courses': (context) => AdminCourses(),
        '/admin_queries': (context) => AdminQueries(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Color.fromARGB(255, 227, 234, 238),
        appBarTheme: AppBarTheme(
          color: Color.fromARGB(255, 227, 234, 238),
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        //textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black)),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
