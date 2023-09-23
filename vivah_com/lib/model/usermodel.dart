// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

import 'dart:convert';

UserDataModel userDataModelFromJson(String str) => UserDataModel.fromJson(json.decode(str));

String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
  String name;
  // String mobile;
  String email;
  String password;
  String address;
  String? imageUrl;

  UserDataModel({
    required this.name,
    // required this.mobile,
    required this.email,
    required this.password,
    required this.address,
    this.imageUrl,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
    name: json["name"],
    // mobile: json["mobile"],
    email: json["email"],
    password: json["password"],
    address: json["address"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    // "mobile": mobile,
    "email": email,
    "password": password,
    "address": address,
    "imageUrl": imageUrl,
  };
}
