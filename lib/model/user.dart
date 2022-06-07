// firebase auth:import users.json --hash-algo=scrypt --rounds=8 --mem-cost=14

// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

List<Users> userFromJson(String str) =>
    List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String userToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  Users({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.url,
  });

  int id;
  String name;
  String username;
  String email;
  String address;
  String phone;
  String url;

  static final studentid = FirebaseAuth.instance.currentUser?.uid;
  static final studentName = FirebaseAuth.instance.currentUser?.displayName ??
      "Please update your name";
  static final studentEmail = FirebaseAuth.instance.currentUser?.email;
  static final studentPhone = FirebaseAuth.instance.currentUser?.phoneNumber ??
      "Please enter your phone number";
  static final studentphotourl = FirebaseAuth.instance.currentUser?.photoURL ??
      "https://cdn.technosports.co.in/wp-content/uploads/2021/11/Aishwarya-Rai-Bachchan-2-980x1024.jpg";

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: json["address"],
        phone: json["phone"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "address": address,
        "phone": phone,
        "url": url,
      };
}
