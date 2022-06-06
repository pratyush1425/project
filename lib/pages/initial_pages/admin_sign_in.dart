// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/pages/admin/Home/admin_home.dart';
import 'package:project/pages/initial_pages/sign_up.dart';

class AdminSignInPage extends StatefulWidget {
  const AdminSignInPage({Key? key}) : super(key: key);

  @override
  State<AdminSignInPage> createState() => AdminSignInPageState();
}

class AdminSignInPageState extends State<AdminSignInPage> {
  String _email = "";
  String _password = "";
  bool flag = true;
  bool viewPassword = true;
  String message = "";

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return flag == false
        ? const SignUpPage()
        : SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 150,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('assets/images/light-1.png'),
                          )),
                        ),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 100,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/light-2.png'))),
                        ),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 50,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/clock.png'))),
                        ),
                      ),
                      Positioned(
                          child: Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Center(
                          child: Text(
                            "ADMIN LOGIN",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Form(
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
                                prefixIcon: Icon(Icons.email),
                                labelText: "Email",
                                border: OutlineInputBorder(),
                                hintText: "Enter your email"),
                            validator: (value) {
                              if (value != "admin@gmail.com") {
                                return "Please enter correct email";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _email = value!;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.password_outlined),
                              labelText: "Password",
                              border: OutlineInputBorder(),
                              hintText: "Enter your password",
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    viewPassword = !viewPassword;
                                  });
                                },
                                icon: viewPassword
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                              ),
                            ),
                            validator: (value) {
                              if (value!.length <= 5) {
                                return "Incorrect Password";
                              }
                              return null;
                            },
                            obscureText: viewPassword,
                            onSaved: (value) {
                              _password = value!;
                            },
                          ),
                        ),
                        const SizedBox(height: 25),
                        Text(
                          message,
                          style: TextStyle(
                              color: Color.fromARGB(255, 209, 30, 17)),
                        ),
                        const SizedBox(height: 25),
                        ElevatedButton(
                            child: const Text(
                              "             Sign In             ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            onPressed: () async {
                              _formkey.currentState!.validate();
                              _formkey.currentState!.save();

                              if (_password.length > 5 &&
                                  _email == "admin@gmail.com") {
                                await singIn(
                                    email: _email, password: _password);
                                if (FirebaseAuth.instance.currentUser != null) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AdminHome(),
                                      ));
                                }
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  Future<void> singIn({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() {
          message = "No admin found for that email.";
        });
      } else if (e.code == 'wrong-password') {
        setState(() {
          message = "Wrong password provided for that admin.";
        });
      }
      setState(() {
        message = e.message.toString();
      });
    } catch (e) {
      setState(() {
        message = e.toString();
      });
    }
  }
}
