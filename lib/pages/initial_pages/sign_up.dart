// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    return SingleChildScrollView(
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
                            image: AssetImage('assets/images/light-1.png'))),
                  ),
                ),
                Positioned(
                  left: 140,
                  width: 80,
                  height: 100,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/light-2.png'))),
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
                            image: AssetImage('assets/images/clock.png'))),
                  ),
                ),
                Positioned(
                    child: Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Center(
                    child: Text(
                      "SIGN UP",
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
                          "             Sign Up             ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          _formkey.currentState!.validate();
                          _formkey.currentState!.save();

                          if (_formkey.currentState!.validate()) {
                            createUser(email: _email, password: _password);
                            if (FirebaseAuth.instance.currentUser != null) {
                              Navigator.pushNamed(context, '/wrapper');
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
          ),
        ],
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
