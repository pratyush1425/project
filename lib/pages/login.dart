import 'package:flutter/material.dart';
import 'package:project/pages/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _name = "";
  String _password = "";

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(255, 233, 236, 237),
      appBar: AppBar(
        title: const Text(
          "MyApp",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Sign In",
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
                          onPressed: () {},
                          child: const Text("Create new account"))
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
