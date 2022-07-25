import 'dart:convert';
import 'dart:io';
import 'package:bookit_driver_app/constants/apiconstants.dart';
import 'package:bookit_driver_app/models/all_trip_model.dart';
import 'package:bookit_driver_app/models/cancelled_trip_model.dart';
import 'package:bookit_driver_app/models/completed_trip_model.dart';
import 'package:bookit_driver_app/models/get_profile_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class APIService {
  final box = GetStorage();

  Future RegisterDriver(String name, contact, ownerName, ownerContact, location,
      licensenumber, expirydate) async {
    print("api called");
    var client = http.Client();
    var completeUrl = APIConstants.baseUrl + APIConstants.register;
    var uri = Uri.parse(completeUrl);
    print(completeUrl);
    final response = await client.post(uri, body: {
      "name": name,
      "contact": contact,
      "ownerName": ownerName,
      "ownerContact": ownerContact,
      "location": location,
      "licensenumber": licensenumber,
      "expirydate": expirydate,
      "fcmToken": await FirebaseMessaging.instance.getToken(),
      "email": "raja@gmail.com"
    });
    print(response.statusCode);
    var convertedDataToJson = jsonDecode(response.body);
    print("result =$convertedDataToJson");
    return convertedDataToJson;
  }

  Future uploadCarDocuments(File? imagefile1, imagefile2, imagefile3,
      imagefile4, imagefile5, imagefile6) async {
    var driverId = box.read('driverId');
    var completeUrl = APIConstants.baseUrl + APIConstants.carDocuments;
    var request = http.MultipartRequest('POST', Uri.parse(completeUrl));
    http.MultipartFile multipartFile1 =
        await http.MultipartFile.fromPath("frontImage", imagefile1?.path ?? '');
    http.MultipartFile multipartFile2 = await http.MultipartFile.fromPath(
        "chaseNumber", imagefile2?.path ?? '');
    http.MultipartFile multipartFile3 =
        await http.MultipartFile.fromPath("rcFront", imagefile3?.path ?? '');
    http.MultipartFile multipartFile4 =
        await http.MultipartFile.fromPath("rcBack", imagefile4?.path ?? '');
    http.MultipartFile multipartFile5 =
        await http.MultipartFile.fromPath("insurance", imagefile5?.path ?? '');
    if (imagefile6?.path != null) {
      if (imagefile6?.path.isNotEmpty) {
        http.MultipartFile multipartFile6 =
            await http.MultipartFile.fromPath("fc", imagefile6?.path ?? '');
        request.files.add(multipartFile6);
      }
    }
    request.fields["driverId"] = '$driverId';
    request.files.add(multipartFile1);
    request.files.add(multipartFile2);
    request.files.add(multipartFile3);
    request.files.add(multipartFile4);
    request.files.add(multipartFile5);
    var res = await request.send();
    String result = await res.stream.bytesToString();
    print(result);
    print(res);
    var convertedDataToJson = jsonDecode(result);
    print("result =$convertedDataToJson");
    return convertedDataToJson;
  }

  Future uploadDriverDocuments(
      File? imagefile1, imagefile2, imagefile3, imagefile4, imagefile5) async {
    var driverId = box.read('driverId');
    var completeUrl = APIConstants.baseUrl + APIConstants.driverDocuments;
    var request = http.MultipartRequest('POST', Uri.parse(completeUrl));
    http.MultipartFile multipartFile1 = await http.MultipartFile.fromPath(
        "profileImage", imagefile1?.path ?? '');
    http.MultipartFile multipartFile2 = await http.MultipartFile.fromPath(
        "licenseFront", imagefile2?.path ?? '');
    http.MultipartFile multipartFile3 = await http.MultipartFile.fromPath(
        "licenseBack", imagefile3?.path ?? '');
    http.MultipartFile multipartFile4 = await http.MultipartFile.fromPath(
        "aadharFront", imagefile4?.path ?? '');
    http.MultipartFile multipartFile5 =
        await http.MultipartFile.fromPath("aadharBack", imagefile5?.path ?? '');
    request.fields["driverId"] = '$driverId';
    request.files.add(multipartFile1);
    request.files.add(multipartFile2);
    request.files.add(multipartFile3);
    request.files.add(multipartFile4);
    request.files.add(multipartFile5);

    var res = await request.send();
    String result = await res.stream.bytesToString();
    print(result);
    print(res);
    var convertedDataToJson = jsonDecode(result);
    print("result =$convertedDataToJson");
    return convertedDataToJson;
  }

  Future uploadOwnerDocuments(File? imagefile1, imagefile2, imagefile3,
      imagefile4, imagefile5, imagefile6) async {
    var driverId = box.read('driverId');
    var completeUrl = APIConstants.baseUrl + APIConstants.ownerDocuments;
    var request = http.MultipartRequest('POST', Uri.parse(completeUrl));
    http.MultipartFile multipartFile1 = await http.MultipartFile.fromPath(
        "aadharFront", imagefile1?.path ?? '');
    http.MultipartFile multipartFile2 =
        await http.MultipartFile.fromPath("aadharBack", imagefile2?.path ?? '');
    http.MultipartFile multipartFile3 =
        await http.MultipartFile.fromPath("panCard", imagefile3?.path ?? '');
    if (imagefile4?.path != null &&
        imagefile5?.path != null &&
        imagefile6?.path != null) {
      if (imagefile4?.path.isNotEmpty &&
          imagefile5?.path.isNotEmpty &&
          imagefile6?.path.isNotEmpty) {
        http.MultipartFile multipartFile4 = await http.MultipartFile.fromPath(
            "passbook", imagefile4?.path ?? '');
        request.files.add(multipartFile4);
        http.MultipartFile multipartFile5 = await http.MultipartFile.fromPath(
            "rentalAgreement1", imagefile5?.path ?? '');
        request.files.add(multipartFile5);
        http.MultipartFile multipartFile6 = await http.MultipartFile.fromPath(
            "rentalAgreement2", imagefile6?.path ?? '');
        request.files.add(multipartFile6);
      }
    }
    request.fields["driverId"] = '$driverId';
    request.files.add(multipartFile1);
    request.files.add(multipartFile2);
    request.files.add(multipartFile3);
    var res = await request.send();
    String result = await res.stream.bytesToString();
    print(result);
    print(res);
    var convertedDataToJson = jsonDecode(result);
    print("result =$convertedDataToJson");
    return convertedDataToJson;
  }

  Future<GetProfileModel?> fetchProfile() async {
    var driverId = box.read('driverId');
    var params = {'driverId': '$driverId'};
    var client = http.Client();
    var completeUrl = APIConstants.baseUrl + APIConstants.getProfile;
    var uri = Uri.parse(completeUrl);
    var newUri = uri.replace(queryParameters: params);
    print('========= uri = $uri ===========');
    print('=========new Uri = $newUri ==========');
    final response = await client.get(newUri);
    print('driverId:$driverId');
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      GetProfileModel getProfileModel =
          GetProfileModel.fromJson(json.decode(response.body));
      print(getProfileModel.toJson());
      return getProfileModel;
    } else {
      return null;
    }
  }

  Future<AllTripModel?> allTripList() async {
    var driverId = box.read('driverId');
    var token = box.read('token');
    var params = {'driverId': '$driverId'};
    var client = http.Client();
    var completeUrl = APIConstants.baseUrl + APIConstants.allTripHistory;
    var uri = Uri.parse(completeUrl);
    var newUri = uri.replace(queryParameters: params);
    print('========= uri = $uri ===========');
    print('=========new Uri = $newUri ==========');
    final response =
        await client.get(newUri, headers: {'Authorization': '$token'});
    print('driverId:$driverId');
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      AllTripModel allTripModel =
          AllTripModel.fromJson(json.decode(response.body));
      print(allTripModel.toJson());
      return allTripModel;
    } else {
      return null;
    }
  }

  Future<CompletedTripModel?> completedTripList() async {
    var driverId = box.read('driverId');
    var params = {'driverId': '$driverId'};
    var client = http.Client();
    var completeUrl = APIConstants.baseUrl + APIConstants.completedTripHistory;
    var uri = Uri.parse(completeUrl);
    var newUri = uri.replace(queryParameters: params);
    print('========= uri = $uri ===========');
    print('=========new Uri = $newUri ==========');
    final response = await client.get(newUri);
    print('driverId:$driverId');
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      CompletedTripModel completedTripModel =
          CompletedTripModel.fromJson(json.decode(response.body));
      print(completedTripModel.toJson());
      return completedTripModel;
    } else {
      return null;
    }
  }

  Future<CancelledTripModel?> cancelledTripList() async {
    var driverId = box.read('driverId');
    var params = {'driverId': '$driverId'};
    var client = http.Client();
    var completeUrl = APIConstants.baseUrl + APIConstants.cancelledTripHistory;
    var uri = Uri.parse(completeUrl);
    var newUri = uri.replace(queryParameters: params);
    print('========= uri = $uri ===========');
    print('=========new Uri = $newUri ==========');
    final response = await client.get(newUri);
    print('driverId:$driverId');
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      CancelledTripModel cancelledTripModel =
          CancelledTripModel.fromJson(json.decode(response.body));
      print(cancelledTripModel.toJson());
      return cancelledTripModel;
    } else {
      return null;
    }
  }
}
