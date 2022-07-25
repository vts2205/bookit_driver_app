// To parse this JSON data, do
//
//     final allTripModel = allTripModelFromJson(jsonString);

import 'dart:convert';

AllTripModel allTripModelFromJson(String str) =>
    AllTripModel.fromJson(json.decode(str));

String allTripModelToJson(AllTripModel data) => json.encode(data.toJson());

class AllTripModel {
  AllTripModel({
    this.statusCode,
    this.code,
    this.message,
    this.body,
  });

  int? statusCode;
  int? code;
  String? message;
  Body? body;

  factory AllTripModel.fromJson(Map<String, dynamic> json) => AllTripModel(
        statusCode: json["statusCode"],
        code: json["code"],
        message: json["message"],
        body: Body.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "code": code,
        "message": message,
        "body": body!.toJson(),
      };
}

class Body {
  Body({
    this.driverId,
    this.tripHistory,
  });

  String? driverId;
  List<dynamic>? tripHistory;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        driverId: json["driver_id"],
        tripHistory: List<dynamic>.from(json["tripHistory"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "driver_id": driverId,
        "tripHistory": List<dynamic>.from(tripHistory!.map((x) => x)),
      };
}
