import 'package:flutter/material.dart';
import 'package:project/pages/home_page/home.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _name = "";
  String _password = "";

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Sign Up",
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
                            labelText: "Name",
                            border: OutlineInputBorder(),
                            hintText: "Enter your username"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Sorry, we don't entertain people without names :P";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _name = value!;
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
                        onPressed: () {
                          _formkey.currentState!.validate();
                          _formkey.currentState!.save();

                          if (_name.isNotEmpty && _password.length > 4) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Home(
                                    name: _name,
                                  ),
                                ));
                          }
                        }),
                    TextButton(
                        onPressed: () {
                          Navigator.restorablePushNamedAndRemoveUntil(
                              context, '/', (route) => false);
                        },
                        child:
                            const Text("Already have an account? Click here"))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
