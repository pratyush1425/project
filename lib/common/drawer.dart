// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
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
              Icons.person,
              color: Color.fromARGB(255, 38, 33, 171),
            ),
            title: Text("Profile"),
            subtitle: Text("student details"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.details,
              color: Color.fromARGB(255, 38, 33, 171),
            ),
            title: Text("Results"),
            subtitle: Text("kuch pdh liya kro"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/results');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.emoji_emotions,
              color: Color.fromARGB(255, 38, 33, 171),
            ),
            title: Text("Attendance"),
            subtitle: Text("nhi bilkul nhi"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/attendance');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.calendar_month,
              color: Color.fromARGB(255, 38, 33, 171),
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
              Icons.logout,
              color: Color.fromARGB(255, 38, 33, 171),
            ),
            title: Text("Logout"),
            subtitle: Text("logout from current device"),
            onTap: (() {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            }),
          ),
        ],
      ),
    );
  }
}
