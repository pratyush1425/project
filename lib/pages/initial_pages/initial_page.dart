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
    return SafeArea(
      child: Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            currentIndex: currentIndex,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey.withOpacity(0.5),
            iconSize: 30,
            selectedIconTheme: IconThemeData(size: 35),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.login,
                  color: Colors.black,
                ),
                label: "SignIn",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.create,
                  color: Colors.black,
                ),
                label: "SignUp",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.admin_panel_settings,
                  color: Colors.black,
                ),
                label: "Admin Login",
              ),
            ]),
      ),
    );
  }
}
