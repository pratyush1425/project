// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Pratyush"),
              accountEmail: Text("pratyush1425@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://media.vanityfair.com/photos/5fcfd7bde9fd5209684824fd/master/w_2560%2Cc_limit/1178141599"),
              ),
              onDetailsPressed: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: Text("Home"),
              subtitle: Text("Student Management System"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: Text("Profile"),
              subtitle: Text("student details"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.calendar_month,
                color: Colors.black,
              ),
              title: Text("Courses"),
              subtitle: Text("view selected courses here"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/courses');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.details,
                color: Colors.black,
              ),
              title: Text("Results"),
              subtitle: Text("View your results here"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/results');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.emoji_emotions,
                color: Colors.black,
              ),
              title: Text("Attendance"),
              subtitle: Text("view your attendance here"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/attendance');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.calendar_month,
                color: Colors.black,
              ),
              title: Text("Payments and dues"),
              subtitle: Text("keep your dues clear"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/payments');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.calendar_month,
                color: Colors.black,
              ),
              title: Text("Events and Notice"),
              subtitle: Text("view upcomings here"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/event');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.calendar_month,
                color: Colors.black,
              ),
              title: Text("Complaints and queries"),
              subtitle: Text("let us help you"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/queries');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              title: Text("Logout"),
              subtitle: Text("logout from current device"),
              onTap: (() {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
