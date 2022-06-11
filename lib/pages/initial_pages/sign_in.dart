// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project/pages/initial_pages/sign_up.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  GoogleSignInAccount? _currentUser;

  String _email = "";
  String _password = "";
  bool flag = true;
  bool viewPassword = true;
  String message = "";

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return flag == false
        ? SignUpPage()
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
                                  image:
                                      AssetImage('assets/images/light-1.png'))),
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
                            "SIGN IN",
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
                  padding: EdgeInsets.all(18.0),
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
                                hintText: "Enter your email"),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !value.contains('@') ||
                                  !value.contains('.')) {
                                return "Please enter correct email";
                              }
                              if (value == "admin@gmail.com") {
                                return "Go to admin Login";
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
                                prefixIcon: Icon(Icons.password_outlined),
                                labelText: "Password",
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
                                border: OutlineInputBorder(),
                                hintText: "Enter your password"),
                            validator: (value) {
                              if (value!.length <= 5) {
                                return "Please enter correct password";
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
                          style: TextStyle(
                              color: Color.fromARGB(255, 209, 30, 17)),
                        ),
                        SizedBox(height: 25),
                        ElevatedButton(
                          child: Text(
                            "             Sign In             ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onPressed: () async {
                            _formkey.currentState!.validate();
                            _formkey.currentState!.save();

                            if (_formkey.currentState!.validate()) {
                              await singIn(email: _email, password: _password);
                              if (FirebaseAuth.instance.currentUser != null) {
                                Navigator.pushNamed(context, '/wrapper');
                              }
                            }
                          },
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                flag = false;
                              });
                            },
                            child: Text("Create new account")),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          child: Text(
                            "             Sign In With Google            ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onPressed: () async {
                            await _signInWithGoogle();
                            if (_currentUser != null) {
                              Navigator.pushNamed(context, '/home');
                            }
                          },
                        ),
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
          message = "No user found for that email.";
        });
      } else if (e.code == 'wrong-password') {
        setState(() {
          message = "Wrong password provided for that user.";
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

  Future<void> _signInWithGoogle() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      setState(() {
        message = error.toString();
      });
    }
  }

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
    });

    ini();
    super.initState();
  }

  Future<void> ini() async {
    await _googleSignIn.signInSilently();
  }
}
