// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:project/common/bottom_bar.dart';
// import 'package:project/common/drawer.dart';

// class Profile extends StatelessWidget {
//   const Profile({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     var username = "Prabhjot Singh";
//     var noOfFriends = 70;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Profile"),
//       ),
//       drawer: MyDrawer(),
//       body: Container(
//         height: size.height * 0.33,
//         color: Color.fromRGBO(79, 147, 255, 1),
//         child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
//           Column(
//             children: [
//               Container(
//                   margin: const EdgeInsets.only(top: 25.0),
//                   height: 80,
//                   decoration: BoxDecoration(
//                     border:
//                         Border.all(color: Color.fromARGB(255, 255, 255, 255)),
//                     color: Color.fromARGB(255, 254, 254, 254),
//                     shape: BoxShape.circle,
//                     image: DecorationImage(
//                       image: NetworkImage(
//                           'https://www.pngall.com/wp-content/uploads/5/Profile-Male-PNG.png'),
//                     ),
//                   )),
//               Text(username,
//                   style: TextStyle(
//                       fontSize: 20.0,
//                       color: Color.fromARGB(255, 255, 255, 255)))
//             ],
//           ),
//           SizedBox(height: 25),
//           Row(
//             children: <Widget>[
//               // Expanded(
//               Expanded(
//                 child: OutlinedButton(
//                     onPressed: () {},
//                     style: OutlinedButton.styleFrom(
//                         side: BorderSide(
//                       color: Colors.transparent,
//                     )),
//                     child: Column(children: [
//                       Text(
//                         "$noOfFriends",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w700,
//                             fontSize: 25.0,
//                             color: Color.fromARGB(255, 255, 255, 255)),
//                       ),
//                       Text(
//                         "Following",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w300,
//                             fontSize: 20.0,
//                             color: Color.fromARGB(255, 255, 255, 255)),
//                       )
//                     ])),
//               ),
//               Expanded(
//                 child: OutlinedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                     Navigator.pushNamed(context, '/edit_profile');
//                   },
//                   style: OutlinedButton.styleFrom(
//                       padding: EdgeInsets.all(5),
//                       side: BorderSide(
//                         color: Colors.transparent,
//                       )),
//                   child: Text(
//                     "EDIT PROFILE",
//                     style: TextStyle(
//                         fontSize: 20.0,
//                         fontWeight: FontWeight.w300,
//                         color: Color.fromARGB(255, 255, 255, 255)),
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ]),
//       ),
//       bottomNavigationBar: MyBottomBar(),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors

// import 'dart:js';

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffdee2fe),
      // appBar: AppBar(
      //   backgroundColor: const Color(0xffdee2fe),
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.edit,
      //       color: Color.fromARGB(255, 76, 165, 175),
      //     ),
      //     onPressed: () {
      //       Navigator.pop(context);
      //       Navigator.pushNamed(context, '/edit_profile');
      //     },
      //   ),
      // ),
      body: SizedBox(
        width: double.infinity,
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/edit_profile');
              },
              child: Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10.0, top: 10.0),
                  alignment: Alignment.topLeft,
                  child: Icon(
                    Icons.edit,
                    size: 30,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    margin: const EdgeInsets.only(
                      top: 30,
                      bottom: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(2, 2),
                          blurRadius: 10,
                        ),
                      ],
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://cdn.technosports.co.in/wp-content/uploads/2021/11/Aishwarya-Rai-Bachchan-2-980x1024.jpg",
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "Kyle",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Text(
                    "Programmer",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 24,
                  right: 24,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "PROFILE",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    listProfile(Icons.person, "Full Name", "Kyle Anderson"),
                    listProfile(
                        Icons.date_range, "Date of Birth", "July 21, 2000"),
                    listProfile(Icons.location_pin, "Location",
                        "California, United States"),
                    listProfile(Icons.male, "Gender", "Male"),
                    listProfile(Icons.phone, "Phone Number", "15555228"),
                    listProfile(Icons.phone, "Phone Number", "15555228"),
                    listProfile(Icons.phone, "Phone Number", "15555228"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listProfile(IconData icon, String text1, String text2) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
          ),
          const SizedBox(
            width: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: const TextStyle(
                  color: Colors.black87,
                  fontFamily: "Montserrat",
                  fontSize: 14,
                ),
              ),
              Text(
                text2,
                style: const TextStyle(
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
