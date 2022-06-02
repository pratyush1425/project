// ignore_for_file: prefer_const_constructors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  @override
  void initState() {
    super.initState();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
        backgroundColor: Colors.white,
        buttonBackgroundColor: Color.fromARGB(255, 137, 154, 163),
        color: Color.fromARGB(255, 174, 188, 194),
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        // currentIndex: currentIndex,
        // type: BottomNavigationBarType.fixed,
        // selectedItemColor: Colors.black,
        // unselectedItemColor: Colors.grey.withOpacity(0.5),
        // showUnselectedLabels: false,
        // selectedIconTheme: IconThemeData(size: 35),
        // iconSize: 30,
        items: const [
          Icon(Icons.home),
          Icon(Icons.details),
          Icon(Icons.emoji_emotions),
          Icon(Icons.calendar_month),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.home),
          //   label: "Home",
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.details,
          //   ),
          //   label: "Results",
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.emoji_emotions,
          //   ),
          //   label: "Attendance",
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.calendar_month,
          //   ),
          //   label: "Events",
          // ),
        ]);
  }
}
