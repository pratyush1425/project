// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/common/bottom_bar.dart';
import 'package:project/common/drawer.dart';

class Results extends StatelessWidget {
  const Results({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Results"),
      ),
      drawer: MyDrawer(),
      body: Container(),
      bottomNavigationBar: MyBottomBar(),
    );
  }
}