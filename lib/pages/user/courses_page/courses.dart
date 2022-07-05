// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/common/drawer.dart';

class Courses extends StatelessWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Courses"),
        ),
        drawer: MyDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 5),
            Card(
              elevation: 5,
              margin: EdgeInsets.all(10),
              child: ListTile(
                leading: GestureDetector(
                    child: Icon(
                      Icons.assessment_outlined,
                      color: Colors.blue,
                      size: 30,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/results');
                    }),
                title: Text('DBMS',
                    style: TextStyle(
                        color: Color.fromARGB(255, 68, 68, 68),
                        fontSize: 27,
                        fontWeight: FontWeight.w600)),
                subtitle: Text(
                  'MC 302',
                  style: TextStyle(
                      color: Color.fromARGB(255, 56, 56, 56),
                      fontWeight: FontWeight.w500),
                ),
                trailing: Text("Teacher 1"),
              ),
            ),
            Card(
              elevation: 5,
              margin: EdgeInsets.all(10),
              child: ListTile(
                leading: GestureDetector(
                    child: Icon(
                      Icons.assessment_outlined,
                      color: Colors.blue,
                      size: 30,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/results');
                    }),
                title: Text('HU',
                    style: TextStyle(
                        color: Color.fromARGB(255, 68, 68, 68),
                        fontSize: 27,
                        fontWeight: FontWeight.w600)),
                subtitle: Text(
                  'MC 304',
                  style: TextStyle(
                      color: Color.fromARGB(255, 56, 56, 56),
                      fontWeight: FontWeight.w500),
                ),
                trailing: Text("Teacher 2"),
              ),
            ),
            Card(
              elevation: 5,
              margin: EdgeInsets.all(10),
              child: ListTile(
                leading: GestureDetector(
                    child: Icon(
                      Icons.assessment_outlined,
                      color: Colors.blue,
                      size: 30,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/results');
                    }),
                title: Text('OS',
                    style: TextStyle(
                        color: Color.fromARGB(255, 68, 68, 68),
                        fontSize: 27,
                        fontWeight: FontWeight.w600)),
                subtitle: Text(
                  'MC 306',
                  style: TextStyle(
                      color: Color.fromARGB(255, 56, 56, 56),
                      fontWeight: FontWeight.w500),
                ),
                trailing: Text("Teacher 3"),
              ),
            ),
            Card(
              elevation: 5,
              margin: EdgeInsets.all(10),
              child: ListTile(
                leading: GestureDetector(
                    child: Icon(
                      Icons.assessment_outlined,
                      color: Colors.blue,
                      size: 30,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/results');
                    }),
                title: Text('OOPS',
                    style: TextStyle(
                        color: Color.fromARGB(255, 68, 68, 68),
                        fontSize: 27,
                        fontWeight: FontWeight.w600)),
                subtitle: Text(
                  'MC 310',
                  style: TextStyle(
                      color: Color.fromARGB(255, 56, 56, 56),
                      fontWeight: FontWeight.w500),
                ),
                trailing: Text("Teacher 4"),
              ),
            )
          ],
        ));
  }
}
