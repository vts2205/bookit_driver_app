// To parse this JSON data, do
//
//     final completedTripModel = completedTripModelFromJson(jsonString);

import 'dart:convert';

CompletedTripModel completedTripModelFromJson(String str) =>
    CompletedTripModel.fromJson(json.decode(str));

String completedTripModelToJson(CompletedTripModel data) =>
    json.encode(data.toJson());

class CompletedTripModel {
  CompletedTripModel({
    this.statusCode,
    this.code,
    this.message,
    this.body,
  });

  int? statusCode;
  int? code;
  String? message;
  Body? body;

  factory CompletedTripModel.fromJson(Map<String, dynamic> json) =>
      CompletedTripModel(
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
    this.tripHistoryCompleted,
  });

  String? driverId;
  List<dynamic>? tripHistoryCompleted;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        driverId: json["driver_id"],
        tripHistoryCompleted:
            List<dynamic>.from(json["tripHistoryCompleted"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "driver_id": driverId,
        "tripHistoryCompleted":
            List<dynamic>.from(tripHistoryCompleted!.map((x) => x)),
      };
}
