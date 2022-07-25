// To parse this JSON data, do
//
//     final cancelledTripModel = cancelledTripModelFromJson(jsonString);

import 'dart:convert';

CancelledTripModel cancelledTripModelFromJson(String str) =>
    CancelledTripModel.fromJson(json.decode(str));

String cancelledTripModelToJson(CancelledTripModel data) =>
    json.encode(data.toJson());

class CancelledTripModel {
  CancelledTripModel({
    this.statusCode,
    this.code,
    this.message,
    this.body,
  });

  int? statusCode;
  int? code;
  String? message;
  Body? body;

  factory CancelledTripModel.fromJson(Map<String, dynamic> json) =>
      CancelledTripModel(
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
    this.tripHistoryCancelled,
  });

  String? driverId;
  List<dynamic>? tripHistoryCancelled;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        driverId: json["driver_id"],
        tripHistoryCancelled:
            List<dynamic>.from(json["tripHistoryCancelled"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "driver_id": driverId,
        "tripHistoryCancelled":
            List<dynamic>.from(tripHistoryCancelled!.map((x) => x)),
      };
}
