import 'package:flutter/material.dart';
import 'package:project/common/drawer.dart';

class Attendance extends StatelessWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendance"),
      ),
      drawer: const MyDrawer(),
      body: Container(),
    );
  }
}
