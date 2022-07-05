// To parse this JSON data, do
//
//     final pairings = pairingsFromJson(jsonString);

import 'dart:convert';

List<Pairings> pairingsFromJson(String str) => List<Pairings>.from(json.decode(str).map((x) => Pairings.fromJson(x)));

String pairingsToJson(List<Pairings> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pairings {
  Pairings({
    this.id,
    this.owner,
    this.installer,
  });

  Id? id;
  bool? owner;
  bool? installer;

  factory Pairings.fromJson(Map<String, dynamic> json) => Pairings(
    id: Id.fromJson(json["id"]),
    owner: json["owner"],
    installer: json["installer"],
  );

  Map<String, dynamic> toJson() => {
    "id": id!.toJson(),
    "owner": owner,
    "installer": installer,
  };
}

class Id {
  Id({
    this.timestamp,
    this.date,
  });

  int? timestamp;
  DateTime? date;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
    timestamp: json["timestamp"],
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp,
    "date": date!.toIso8601String(),
  };
}
