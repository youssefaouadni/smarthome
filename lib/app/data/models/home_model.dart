// To parse this JSON data, do
//
//     final homes = homesFromJson(jsonString);

import 'dart:convert';

List<Homes> homesFromJson(String str) => List<Homes>.from(json.decode(str).map((x) => Homes.fromJson(x)));

String homesToJson(List<Homes> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Homes {
  Homes({
    this.verHard,
    this.verSoft,
    this.dateFab,
    this.dateOeuvre,
    this.zones,
    this.label,
    this.location,
    this.id,
  });

  String? verHard;
  String? verSoft;
  DateTime? dateFab;
  DateTime? dateOeuvre;
  dynamic zones;
  String? label;
  String? location;
  Id? id;

  factory Homes.fromJson(Map<String, dynamic> json) => Homes(
    verHard: json["verHard"],
    verSoft: json["verSoft"],
    dateFab: DateTime.parse(json["dateFab"]),
    dateOeuvre: DateTime.parse(json["dateOeuvre"]),
    zones: json["zones"],
    label: json["label"],
    location: json["location"],
    id: Id.fromJson(json["id"]),
  );

  Map<String, dynamic> toJson() => {
    "verHard": verHard,
    "verSoft": verSoft,
    "dateFab": dateFab!.toIso8601String(),
    "dateOeuvre": dateOeuvre!.toIso8601String(),
    "zones": zones,
    "label": label,
    "location": location,
    "id": id!.toJson(),
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
