// import 'package:flutter/material.dart';
// import 'package:project/common/drawer.dart';

// class Editprofile extends StatefulWidget {
//   const Editprofile({Key? key}) : super(key: key);

//   @override
//   State<Editprofile> createState() => _EditprofileState();
// }

// class _EditprofileState extends State<Editprofile> {
//   bool flag = true;
//   String message = "";

//   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

// ignore_for_file: prefer_const_constructors

//   @override
//   Widget build(BuildContext context) {
//     //double screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Edit Profile"),
//       ),
//       drawer: MyDrawer(),
//       body: Padding(
//         padding: const EdgeInsets.all(25.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(
//                     "EDIT PROFILE",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   )),
//               Form(
//                 key: _formkey,
//                 child: Column(
//                   children: <Widget>[
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextFormField(
//                         decoration: const InputDecoration(
//                           labelText: "Email",
//                           labelStyle: TextStyle(
//                             fontSize: 20,
//                           ),
//                           // border: OutlineInputBorder(),
//                           // hintText: "Edit your email"
//                         ),
//                         validator: (value) {
//                           if (value!.isEmpty ||
//                               !value.contains('@') ||
//                               !value.contains('.')) {
//                             return "Please enter correct email";
//                           }
//                           return null;
//                         },
//                         onSaved: (value) {},
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextFormField(
//                         decoration: const InputDecoration(
//                             labelText: "Name",
//                             border: OutlineInputBorder(),
//                             hintText: "Enter your name"),
//                         validator: (value) {
//                           return null;
//                         },
//                         onSaved: (value) {},
//                       ),
//                     ),
//                     const SizedBox(height: 25),
//                     Text(
//                       message,
//                       style: TextStyle(color: Color.fromARGB(255, 209, 30, 17)),
//                     ),
//                     const SizedBox(height: 25),
//                     ElevatedButton(
//                         child: const Text(
//                           "Submit",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         onPressed: () async {
//                           _formkey.currentState!.validate();
//                           _formkey.currentState!.save();
//                         }),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
// import 'package:project/common/drawer.dart';

class EditProfile extends StatefulWidget {
  @override
  Editprofile createState() => Editprofile();
}

class Editprofile extends State<EditProfile> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.green,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
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
                            color: Colors.green,
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
              buildTextField("Full Name", "Dor Alex", false),
              buildTextField("E-mail", "alexd@gmail.com", false),
              buildTextField("Password", "********", true),
              buildTextField("Location", "TLV, Israel", false),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    // padding: EdgeInsets.symmetric(horizontal: 50),
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(20)),
                    onPressed: () {},
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    // color: Colors.green,
                    // padding: EdgeInsets.symmetric(horizontal: 50),
                    // elevation: 2,
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
