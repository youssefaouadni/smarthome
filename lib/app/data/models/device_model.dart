// To parse this JSON data, do
//
//     final devices = devicesFromJson(jsonString);

import 'dart:convert';

List<Devices> devicesFromJson(String str) => List<Devices>.from(json.decode(str).map((x) => Devices.fromJson(x)));

String devicesToJson(List<Devices> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Devices {
  Devices({
    this.idD,
    this.ref,
  });

  IdD? idD;
  String? ref;

  factory Devices.fromJson(Map<String, dynamic> json) => Devices(
    idD: IdD.fromJson(json["idD"]),
    ref: json["ref"],
  );

  Map<String, dynamic> toJson() => {
    "idD": idD!.toJson(),
    "ref": ref,
  };
}

class IdD {
  IdD({
    this.timestamp,
    this.date,
  });

  int? timestamp;
  DateTime? date;

  factory IdD.fromJson(Map<String, dynamic> json) => IdD(
    timestamp: json["timestamp"],
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp,
    "date": date!.toIso8601String(),
  };
}
