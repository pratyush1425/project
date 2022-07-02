// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project/model/user.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(Users.studentName),
              accountEmail: Text(Users.studentEmail),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(Users.studentphotourl),
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
              onTap: (() async {
                await signOut();
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
    await _googleSignIn.signOut();
  }
}
