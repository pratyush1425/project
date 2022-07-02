// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/model/user.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdee2fe),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            margin: EdgeInsets.only(left: 10.0, top: 10.0),
            alignment: Alignment.topLeft,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/edit_profile');
                },
                icon: Icon(
                  Icons.edit,
                  size: 30,
                )),
          ),
          Column(
            children: [
              Container(
                height: 120,
                width: 120,
                margin: EdgeInsets.only(
                  top: 30,
                  bottom: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(Users.studentphotourl),
                  ),
                ),
              ),
              Text(
                "Kyle",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                "Programmer",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 35,
          ),
          SingleChildScrollView(
            //// watchout :)
            child: Container(
              padding: EdgeInsets.only(
                top: 20,
                left: 24,
                right: 24,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "PROFILE",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  listProfile(Icons.person, "Full Name", "Kyle Anderson"),
                  listProfile(Icons.person_pin, "Roll No", "2K19/MC/155"),
                  listProfile(
                      Icons.date_range, "Date of Birth", "July 21, 2000"),
                  listProfile(Icons.male, "Gender", "Male"),
                  listProfile(Icons.mail, "Email Id", "kyle@gmail.com"),
                  listProfile(Icons.phone, "Phone Number", "9212939492"),
                  listProfile(Icons.location_pin, "Address",
                      "California, United States"),
                  SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listProfile(IconData icon, String text1, String text2) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
          ),
          SizedBox(
            width: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: "Montserrat",
                  fontSize: 14,
                ),
              ),
              Text(
                text2,
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
