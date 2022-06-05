import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/pages/admin/Home/admin_home.dart';
import 'package:project/pages/initial_pages/initial_page.dart';
import 'package:project/pages/user/home_page/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      if (FirebaseAuth.instance.currentUser?.email == "admin@gmail.com") {
        return const AdminHome();
      } else {
        return const Home();
      }
    }
    return const InitialPage();
  }
}
