// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/common/admin_drawer.dart';
import 'package:project/common/bottom_bar.dart';

class AdminCourses extends StatelessWidget {
  const AdminCourses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Courses"),
      ),
      drawer: AdminDrawer(),
      body: Container(),
      bottomNavigationBar: MyBottomBar(),
    );
  }
}