// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/common/bottom_bar.dart';
import 'package:project/common/drawer.dart';

class Home extends StatelessWidget {
  final String name =
      (FirebaseAuth.instance.currentUser?.displayName).toString();
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Management System"),
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              "Welcome " + name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.edit),
        enableFeedback: true,
      ),
      extendBody: true,
      bottomNavigationBar: MyBottomBar(),
    );
  }
}
