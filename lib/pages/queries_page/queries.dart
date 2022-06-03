// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/common/bottom_bar.dart';
import 'package:project/common/drawer.dart';

class Queries extends StatelessWidget {
  const Queries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complaints and Queries"),
      ),
      drawer: MyDrawer(),
      body: Container(),
      bottomNavigationBar: MyBottomBar(),
    );
  }
}