// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/pages/initial_pages/admin_sign_in.dart';
import 'package:project/pages/initial_pages/sign_in.dart';
import 'package:project/pages/initial_pages/sign_up.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({
    Key? key,
  }) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  int currentIndex = 0;

  List pages = [SignInPage(), SignUpPage(), AdminSignInPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      // resizeToAvoidBottomInset: true,
      // persistentFooterButtons: [],
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          enableFeedback: true,
          backgroundColor: Color.fromARGB(255, 227, 234, 238),
          selectedItemColor: Color.fromARGB(255, 140, 120, 255),
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          currentIndex: currentIndex,
          iconSize: 30,
          selectedIconTheme: IconThemeData(size: 40),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.school,
                color: currentIndex == 0
                    ? Color.fromARGB(255, 140, 120, 255)
                    : Colors.grey,
              ),
              label: "SignIn",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.create,
                color: currentIndex == 1
                    ? Color.fromARGB(255, 140, 120, 255)
                    : Colors.grey,
              ),
              label: "SignUp",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.admin_panel_settings,
                color: currentIndex == 2
                    ? Color.fromARGB(255, 140, 120, 255)
                    : Colors.grey,
              ),
              label: "Admin Login",
            ),
          ]),
    );
  }
}
