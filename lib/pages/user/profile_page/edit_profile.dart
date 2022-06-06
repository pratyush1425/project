// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, unnecessary_brace_in_string_interps

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Editprofile createState() => Editprofile();
}

class Editprofile extends State<EditProfile> {
  bool showPassword = true;
  var name = FirebaseAuth.instance.currentUser?.displayName ??
      "Please update your name";
  var email = FirebaseAuth.instance.currentUser?.email;
  var password = "";
  var phone = FirebaseAuth.instance.currentUser?.phoneNumber ??
      "Please enter your phone number";
  var photourl = FirebaseAuth.instance.currentUser?.photoURL ??
      "https://cdn.technosports.co.in/wp-content/uploads/2021/11/Aishwarya-Rai-Bachchan-2-980x1024.jpg";

  var address = "DTU, Delhi";

  @override
  Widget build(BuildContext context) {
//     if (FirebaseAuth.instance.currentUser != null) {
//     for (final providerProfile in FirebaseAuth.instance.currentUser!.providerData) {
//         // ID of the provider (google.com, apple.cpm, etc.)
//         final provider = providerProfile.providerId;

//         // UID specific to the provider
//         final uid = providerProfile.uid;

//         // Name, email address, and profile photo URL
//         final name = providerProfile.displayName;
//         final emailAddress = providerProfile.email;
//         final profilePhoto = providerProfile.photoURL;
//     }
// }
    // var size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 76, 165, 175),
          ),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/profile');
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 12),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 1,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.3),
                                offset: Offset(0, 5))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                photourl,
                              ))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Color.fromARGB(255, 76, 165, 175),
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField("Full Name", name, false),
              buildTextField("E-mail", email, false),
              buildTextField("Password", password, true),
              buildTextField("Phone", phone, false),
              buildTextField("Address", address, false),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(14, 0, 0, 0),
                    width: 120,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/edit_profile');
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        )),
                      ),
                      child: Text(
                        "CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
                    width: 120,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () async {
                        // await FirebaseAuth.instance.currentUser?.updateDisplayName("Jane Q. User");
                        // await FirebaseAuth.instance.currentUser?.updateEmail("janeq@example.com");
                        // await FirebaseAuth.instance.currentUser?.sendEmailVerification();
                        // await FirebaseAuth.instance.currentUser?.updatePhoneNumber(phoneCredential);
                        // await FirebaseAuth.instance.currentUser?.verifyBeforeUpdateEmail(newEmail);
                        //
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        )),
                      ),
                      child: Text(
                        "SAVE",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 35,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(labelText, placeholder, isPasswordTextField) {
    return Padding(
      padding: EdgeInsets.only(bottom: 35.0, left: 16, right: 16),
      child: TextField(
        // controller: placeholder,
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: showPassword
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 75, 75, 75),
            )),
      ),
    );
  }
}
