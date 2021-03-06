// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/common/admin_drawer.dart';
import 'package:project/common/bottom_bar.dart';

class AdminEvents extends StatelessWidget {
  const AdminEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events And Notice"),
      ),
      drawer: AdminDrawer(),
      body: ListView.builder(
          itemCount: 51,
          itemBuilder: (context, index) {
            return index > 0
                ? ListTile(
                    leading: Icon(Icons.event),
                    title: Text("Event $index"),
                  )
                : Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      " Events this week",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  );
          }),
      bottomNavigationBar: MyBottomBar(),
    );
  }
}
