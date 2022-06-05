// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/common/drawer.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({Key? key}) : super(key: key);

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  bool flag = true;
  String message = "";

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "EDIT PROFILE",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                            fontSize: 20,
                          ),
                          // border: OutlineInputBorder(),
                          // hintText: "Edit your email"
                        ),
                        validator: (value) {
                          if (value!.isEmpty ||
                              !value.contains('@') ||
                              !value.contains('.')) {
                            return "Please enter correct email";
                          }
                          return null;
                        },
                        onSaved: (value) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: "Name",
                            border: OutlineInputBorder(),
                            hintText: "Enter your name"),
                        validator: (value) {
                          return null;
                        },
                        onSaved: (value) {},
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      message,
                      style: TextStyle(color: Color.fromARGB(255, 209, 30, 17)),
                    ),
                    const SizedBox(height: 25),
                    ElevatedButton(
                        child: const Text(
                          "Submit",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          _formkey.currentState!.validate();
                          _formkey.currentState!.save();
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
