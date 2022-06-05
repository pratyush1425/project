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
        : Padding(
            padding: const EdgeInsets.all(25.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image(
                      image: NetworkImage(
                          "https://th.bing.com/th/id/R.1846ff77261b4570d312d887e1208094?rik=1mCkqqg9gQJpMg&riu=http%3a%2f%2fclipart-library.com%2fimages_k%2freading-silhouette%2freading-silhouette-16.png&ehk=KcKpLbtz8ph%2fW7xI8vUv6z5349q9knWsAO0wiuNklPU%3d&risl=&pid=ImgRaw&r=0")),
                  const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Admin Login",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                              "Sign In",
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
                ],
              ),
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
