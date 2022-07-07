// To parse this JSON data, do
//
//     final zone = zoneFromJson(jsonString);

import 'dart:convert';

List<Zone> zoneFromJson(String str) => List<Zone>.from(json.decode(str).map((x) => Zone.fromJson(x)));

String zoneToJson(List<Zone> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Zone {
  Zone({
    this.idZ,
    this.label,
    this.devices,
    this.pairings,
  });

  IdZ? idZ;
  String? label;
  dynamic devices;
  dynamic pairings;

  factory Zone.fromJson(Map<String, dynamic> json) => Zone(
    idZ: IdZ.fromJson(json["idZ"]),
    label: json["label"] == null ? null : json["label"],
    devices: json["devices"],
    pairings: json["pairings"],
  );

  Map<String, dynamic> toJson() => {
    "idZ": idZ!.toJson(),
    "label": label == null ? null : label,
    "devices": devices,
    "pairings": pairings,
  };
}

class IdZ {
  IdZ({
    this.timestamp,
    this.date,
  });

  int? timestamp;
  DateTime? date;

  factory IdZ.fromJson(Map<String, dynamic> json) => IdZ(
    timestamp: json["timestamp"],
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp,
    "date": date!.toIso8601String(),
  };
}
