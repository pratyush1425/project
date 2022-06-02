import 'package:flutter/material.dart';

class MyBottomBar extends StatelessWidget {
  const MyBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: BottomAppBar(
        color: Colors.blue,
        child: Text(
          "",
          style: TextStyle(
            height: 2,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
