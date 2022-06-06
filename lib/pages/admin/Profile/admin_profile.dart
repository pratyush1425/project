// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/common/admin_drawer.dart';
import 'package:project/common/bottom_bar.dart';

class AdminProfile extends StatelessWidget {
  const AdminProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var username = "Admin";
    var noOfFriends = 70;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),

      drawer: AdminDrawer(),
      // ignore: sized_box_for_whitespace
      body: Container(
        height: size.height * 0.33,
        // color: Color.fromRGBO(79, 147, 255, 1),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 25.0),
                  height: 80,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromARGB(255, 255, 255, 255)),
                    color: Colors.black,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://www.pngall.com/wp-content/uploads/5/Profile-Male-PNG.png'),
                    ),
                  )),
              Text(username,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(height: 25),
          Row(
            children: <Widget>[
              // Expanded(
              Expanded(
                child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(
                      color: Colors.transparent,
                    )),
                    child: Column(children: [
                      Text(
                        "$noOfFriends",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                            color: Colors.black),
                      ),
                      Text(
                        "Following",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.black),
                      )
                    ])),
              ),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.all(5),
                      side: BorderSide(
                        color: Colors.transparent,
                      )),
                  child: Text(
                    "EDIT PROFILE",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
      bottomNavigationBar: MyBottomBar(),
    );
  }
}
