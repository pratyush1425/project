// firebase auth:import users.json --hash-algo=scrypt --rounds=8 --mem-cost=14

// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

List<Users> userFromJson(String str) =>
    List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String userToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

int? id;
String? name;
String? email;
String? address;
String? phone;
String? url;

class Users {
  Users({
    this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.url,
  });

  int? id;
  String? name;
  String? email;
  String? address;
  String? phone;
  String? url;

  static final studentid = FirebaseAuth.instance.currentUser?.uid;
  static final studentName = FirebaseAuth.instance.currentUser?.displayName ??
      "Please update your name";
  static final studentEmail =
      FirebaseAuth.instance.currentUser?.email ?? "email not found";
  static final studentPhone = FirebaseAuth.instance.currentUser?.phoneNumber ??
      "Please enter your phone number";
  static final studentphotourl = FirebaseAuth.instance.currentUser?.photoURL ??
      "https://media.vanityfair.com/photos/5fcfd7bde9fd5209684824fd/master/w_2560%2Cc_limit/1178141599";

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        address: json["address"],
        phone: json["phone"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "address": address,
        "phone": phone,
        "url": url,
      };

  Future createUser(Users user) async {
    final docuser = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid);
    user.id = docuser.id as int?;
    final json = user.toJson();
    await docuser.set(json);
  }
}
