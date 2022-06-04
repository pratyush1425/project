// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
// import 'package:project/common/bottom_bar.dart';
import 'package:project/common/drawer.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var username = "Prabhjot Singh";
    var no_of_friends = 70;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Profile"),
      // ),
      drawer: MyDrawer(),
      body: Container(
        height: size.height * 0.33,
        color: Color.fromRGBO(79, 147, 255, 1),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 25.0),
                  height: 80,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromARGB(255, 255, 255, 255)),
                    color: Color.fromARGB(255, 254, 254, 254),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://www.pngall.com/wp-content/uploads/5/Profile-Male-PNG.png'),
                    ),
                  )),
              Text("${username}",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Color.fromARGB(255, 255, 255, 255)))
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
                        "${no_of_friends}",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 25.0,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      Text(
                        "Following",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 20.0,
                            color: Color.fromARGB(255, 255, 255, 255)),
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
                        fontWeight: FontWeight.w300,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
      // bottomNavigationBar: MyBottomBar(),
    );
  }
}
