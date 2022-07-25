// To parse this JSON data, do
//
//     final getProfileModel = getProfileModelFromJson(jsonString);

import 'dart:convert';

GetProfileModel getProfileModelFromJson(String str) =>
    GetProfileModel.fromJson(json.decode(str));

String getProfileModelToJson(GetProfileModel data) =>
    json.encode(data.toJson());

class GetProfileModel {
  GetProfileModel({
    this.statusCode,
    this.code,
    this.message,
    this.body,
  });

  int? statusCode;
  int? code;
  String? message;
  Body? body;

  factory GetProfileModel.fromJson(Map<String, dynamic> json) =>
      GetProfileModel(
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
    this.getprofiledetails,
  });

  String? driverId;
  List<Getprofiledetail>? getprofiledetails;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        driverId: json["driver_id"],
        getprofiledetails: List<Getprofiledetail>.from(
            json["getprofiledetails"].map((x) => Getprofiledetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "driver_id": driverId,
        "getprofiledetails":
            List<dynamic>.from(getprofiledetails!.map((x) => x.toJson())),
      };
}

class Getprofiledetail {
  Getprofiledetail({
    this.id,
    this.driverId,
    this.name,
    this.email,
    this.contact,
    this.password,
    this.gender,
    this.dob,
    this.currentCarId,
    this.documentId,
    this.ownerId,
    this.ownerName,
    this.ownerNumber,
    this.location,
    this.licenseNumber,
    this.expiryDate,
    this.rentalType,
    this.ratings,
    this.fcmToken,
    this.referral,
    this.driverStatus,
    this.reason,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? driverId;
  String? name;
  String? email;
  String? contact;
  String? password;
  dynamic gender;
  dynamic dob;
  String? currentCarId;
  String? documentId;
  dynamic ownerId;
  String? ownerName;
  String? ownerNumber;
  String? location;
  String? licenseNumber;
  String? expiryDate;
  int? rentalType;
  int? ratings;
  String? fcmToken;
  String? referral;
  String? driverStatus;
  dynamic reason;
  String? createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Getprofiledetail.fromJson(Map<String, dynamic> json) =>
      Getprofiledetail(
        id: json["id"],
        driverId: json["driver_id"],
        name: json["name"],
        email: json["email"],
        contact: json["contact"],
        password: json["password"],
        gender: json["gender"],
        dob: json["dob"],
        currentCarId: json["current_car_id"],
        documentId: json["document_id"],
        ownerId: json["owner_id"],
        ownerName: json["owner_name"],
        ownerNumber: json["owner_number"],
        location: json["location"],
        licenseNumber: json["license_number"],
        expiryDate: json["expiry_date"],
        rentalType: json["rental_type"],
        ratings: json["ratings"],
        fcmToken: json["fcm_token"],
        referral: json["referral"],
        driverStatus: json["driver_status"],
        reason: json["reason"],
        createdBy: json["created_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "driver_id": driverId,
        "name": name,
        "email": email,
        "contact": contact,
        "password": password,
        "gender": gender,
        "dob": dob,
        "current_car_id": currentCarId,
        "document_id": documentId,
        "owner_id": ownerId,
        "owner_name": ownerName,
        "owner_number": ownerNumber,
        "location": location,
        "license_number": licenseNumber,
        "expiry_date": expiryDate,
        "rental_type": rentalType,
        "ratings": ratings,
        "fcm_token": fcmToken,
        "referral": referral,
        "driver_status": driverStatus,
        "reason": reason,
        "created_by": createdBy,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
