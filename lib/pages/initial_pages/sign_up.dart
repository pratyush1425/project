// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/pages/user/home_page/home.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email = "";
  String _password = "";
  String message = "";
  bool viewPassword = true;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: "Email",
                            border: OutlineInputBorder(),
                            hintText: "Enter your Email"),
                        validator: (value) {
                          if (value!.isEmpty ||
                              !value.contains('@') ||
                              !value.contains('.')) {
                            return "Please enter correct Email ";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _email = value!;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password),
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
                                  : Icon(Icons.visibility_off)),
                        ),
                        validator: (value) {
                          if (value!.length <= 5) {
                            return "Oops, Your Password is too short \nMake it greater than 5 characters ;)";
                          }
                          return null;
                        },
                        obscureText: viewPassword,
                        onSaved: (value) {
                          _password = value!;
                        },
                      ),
                    ),
                    SizedBox(height: 25),
                    Text(
                      message,
                      style: TextStyle(color: Color.fromARGB(255, 209, 30, 17)),
                    ),
                    SizedBox(height: 25),
                    ElevatedButton(
                        child: Text(
                          "Submit",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          _formkey.currentState!.validate();
                          _formkey.currentState!.save();

                          if (_email.isNotEmpty &&
                              _password.length > 5 &&
                              _email.contains('@') &&
                              _email.contains('.')) {
                            createUser(email: _email, password: _password);
                            if (FirebaseAuth.instance.currentUser != null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Home(),
                                  ));
                            }
                          }
                        }),
                    TextButton(
                        onPressed: () {
                          Navigator.restorablePushNamedAndRemoveUntil(
                              context, '/', (route) => false);
                        },
                        child: Text("Already have an account? Click here")),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Future createUser({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        setState(() {
          message = "The password provided is too weak.";
        });
      } else if (e.code == 'email-already-in-use') {
        setState(() {
          message = "The account already exists for that email.";
        });
      }
    } catch (e) {
      setState(() {
        message = e.toString();
      });
    }
  }
}
