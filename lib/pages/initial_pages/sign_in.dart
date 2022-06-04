import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/pages/home_page/home.dart';
import 'package:project/pages/initial_pages/sign_up.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  String _email = "";
  String _password = "";
  bool flag = true;
  // final AuthService _auth = AuthService();
  // dynamic auth = FirebaseAuth.instance;

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
                  const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Sign In",
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
                                  labelText: "Email",
                                  border: OutlineInputBorder(),
                                  hintText: "Enter your email"),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !value.contains('@') ||
                                    !value.contains('.')) {
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
                              decoration: const InputDecoration(
                                  labelText: "Password",
                                  border: OutlineInputBorder(),
                                  hintText: "Enter your password"),
                              validator: (value) {
                                if (value!.length <= 4) {
                                  return "Oops, Your Password is too short \nMake it greater than 4 digits ;)";
                                }
                                return null;
                              },
                              obscureText: true,
                              onSaved: (value) {
                                _password = value!;
                              },
                            ),
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

                                if (_email.isNotEmpty &&
                                    _password.length > 4 &&
                                    _email.contains('@') &&
                                    _email.contains('.')) {
                                  await singIn(
                                      email: _email, password: _password);
                                  if (FirebaseAuth.instance.currentUser !=
                                      null) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Home(
                                            name: _email,
                                          ),
                                        ));
                                  } else {
                                    const Text("Wrong username or password");
                                  }
                                }
                              }),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  flag = false;
                                });
                              },
                              child: const Text("Create new account"))
                        ],
                      )),
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
        print("No user found for that email.");
      } else if (e.code == 'wrong-password') {
        print("Wrong password provided for that user.");
      }
      print(e.message);
    } catch (e) {
      print(e.toString());
    }
  }
}
