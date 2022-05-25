import 'package:flutter/material.dart';
import 'package:project/common/drawer.dart';

class Results extends StatelessWidget {
  const Results ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Results"),
      ),
      drawer: const MyDrawer(),
      body: Container(),
    );
  }
}
