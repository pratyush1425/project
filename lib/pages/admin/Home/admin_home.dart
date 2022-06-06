// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/common/admin_drawer.dart';
import 'package:project/common/bottom_bar.dart';

class AdminHome extends StatelessWidget {
  final String name = "Sir";
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome " + name,
        ),
      ),
      drawer: AdminDrawer(),
      body: ListView(
        children: const [
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
