// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

List<Users> usersFromJson(String str) =>
    List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  Users({
    this.idUser,
    this.name,
    this.lastname,
    this.email,
    this.address,
    this.role,
  });

  IdUser? idUser;
  String? name;
  String? lastname;
  String? email;
  String? address;
  String? role;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        idUser: IdUser.fromJson(json["idUser"]),
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        address: json["address"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "idUser": idUser!.toJson(),
        "name": name,
        "lastname": lastname,
        "email": email,
        "address": address,
        "role": role,
      };
}

class IdUser {
  IdUser({
    this.timestamp,
    this.date,
  });

  int? timestamp;
  DateTime? date;

  factory IdUser.fromJson(Map<String, dynamic> json) => IdUser(
        timestamp: json["timestamp"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "date": date!.toIso8601String(),
      };
}
