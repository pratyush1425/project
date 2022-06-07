// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                  (FirebaseAuth.instance.currentUser?.displayName != null)
                      ? (FirebaseAuth.instance.currentUser?.displayName)
                          .toString()
                      : "Admin"),
              accountEmail:
                  Text((FirebaseAuth.instance.currentUser?.email).toString()),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage((FirebaseAuth
                            .instance.currentUser?.photoURL !=
                        null)
                    ? (FirebaseAuth.instance.currentUser?.photoURL).toString()
                    : "https://media.vanityfair.com/photos/5fcfd7bde9fd5209684824fd/master/w_2560%2Cc_limit/1178141599"),
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
                Navigator.pushNamed(context, '/admin_home');
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
                Navigator.pushNamed(context, '/admin_profile');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.calendar_month,
                color: Colors.black,
              ),
              title: Text("Courses"),
              subtitle: Text("add courses"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/admin_courses');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.details,
                color: Colors.black,
              ),
              title: Text("Results"),
              subtitle: Text("upload results here"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/admin_results');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.emoji_emotions,
                color: Colors.black,
              ),
              title: Text("Attendance"),
              subtitle: Text("upload attendance here"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/admin_attendance');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.calendar_month,
                color: Colors.black,
              ),
              title: Text("Events and Notice"),
              subtitle: Text("add new events and notices"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/admin_event');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.calendar_month,
                color: Colors.black,
              ),
              title: Text("Complaints and queries"),
              subtitle: Text("view students complaints and queries here"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/admin_queries');
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
                signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/wrapper', (route) => false);
              }),
            ),
          ],
        ),
      ),
    );
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
