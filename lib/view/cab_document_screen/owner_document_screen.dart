import 'dart:io';
import 'package:bookit_driver_app/service/apiservice.dart';
import 'package:bookit_driver_app/view/authentication/thank_you_screen.dart';
import 'package:bookit_driver_app/view/camera.dart';
import 'package:bookit_driver_app/view/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants/colors.dart';

class OwnerDocumentScreen extends StatefulWidget {
  const OwnerDocumentScreen({Key? key}) : super(key: key);

  @override
  State<OwnerDocumentScreen> createState() => _OwnerDocumentScreenState();
}

class _OwnerDocumentScreenState extends State<OwnerDocumentScreen> {
  File? image;
  int clickedDocType = 0;

  File? aadhaarFront;
  File? aadhaarBack;
  File? panCard;
  File? passbook;
  File? rentalAgreement1;
  File? rentalAgreement2;

  void pickImage(int type) async {
    File? imageFile;
    if (type == 0) {
      imageFile = await cameraImage();
    } else {
      imageFile = await galleryImage();
    }
    print(imageFile);
    print(clickedDocType);
    switch (clickedDocType) {
      case 1:
        {
          setState(() {
            aadhaarFront = imageFile;
          });
        }
        break;
      case 2:
        {
          setState(() {
            aadhaarBack = imageFile;
          });
        }
        break;
      case 3:
        {
          setState(() {
            panCard = imageFile;
          });
        }
        break;
      case 4:
        {
          setState(() {
            passbook = imageFile;
          });
        }
        break;
      case 5:
        {
          setState(() {
            rentalAgreement1 = imageFile;
          });
        }
        break;
      case 6:
        {
          setState(() {
            rentalAgreement2 = imageFile;
          });
        }
        break;
      default:
        {
          //statements;
        }
        break;
    }
  }

  Future<File?> galleryImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return null;
      final imageTemp = File(image.path);
      return imageTemp;
    } on PlatformException catch (e) {
      print('failed to pick image: $e');
      return null;
    }
  }

  Future<File?> cameraImage() async {
    try {
      final image = await Get.to(TakePhoto());
      if (image == null) return null;
      final imageTemp = File(image.path);
      return imageTemp;
    } on PlatformException catch (e) {
      print('failed to pick image: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Owner Documents',
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: blue),
              ),
              const SizedBox(height: 20),
              buildFileUploadButton('Aadhaar front', 1),
              const SizedBox(height: 20),
              buildFileUploadButton('Aadhaar back', 2),
              const SizedBox(height: 20),
              buildFileUploadButton('Pan', 3),
              const SizedBox(height: 20),
              buildFileUploadButton('Passbook (optional)', 4),
              const SizedBox(height: 20),
              buildFileUploadButton('Rental Agreement 1st page (optional)', 5),
              const SizedBox(height: 20),
              buildFileUploadButton('Rental Agreement 2nd page (optional)', 6),
              const SizedBox(height: 20),
              buildSubmitButton()
            ],
          ),
        ),
      )),
    );
  }

  buildFileUploadButton(String title, int type) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(title,
              //overflow: TextOverflow.fade,
              style: TextStyle(fontSize: 18, color: green)),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: getData(type),
        ),
        buildUploadButton(type)
      ],
    );
  }

  Widget getData(int type) {
    switch (type) {
      case 1:
        {
          return aadhaarFront != null
              ? Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                  child: Image.file(
                    aadhaarFront!,
                    fit: BoxFit.fill,
                  ))
              : Text('No File');
        }
      case 2:
        {
          return aadhaarBack != null
              ? Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                  child: Image.file(
                    aadhaarBack!,
                    fit: BoxFit.fill,
                  ))
              : Text('No File');
        }
      case 3:
        {
          return panCard != null
              ? Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                  child: Image.file(
                    panCard!,
                    fit: BoxFit.fill,
                  ))
              : Text('No File');
        }
      case 4:
        {
          return passbook != null
              ? Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                  child: Image.file(
                    passbook!,
                    fit: BoxFit.fill,
                  ))
              : Text('No File');
        }

      case 5:
        {
          return rentalAgreement1 != null
              ? Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                  child: Image.file(
                    rentalAgreement1!,
                    fit: BoxFit.fill,
                  ))
              : Text('No File');
        }
      case 6:
        {
          return rentalAgreement2 != null
              ? Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                  child: Image.file(
                    rentalAgreement2!,
                    fit: BoxFit.fill,
                  ))
              : Text('No File');
        }
      default:
        {
          return Text('No File');
        }
    }
  }

  buildUploadButton(int type) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: blue, padding: EdgeInsets.symmetric(horizontal: 2)),
      onPressed: () {
        onPress(type);
      },
      child: Text(
        'Upload',
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
    );
  }

  void onPress(int id) {
    print('pressed $id');
    clickedDocType = id;
    buildBottomSheet();
  }

  buildSubmitButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: green),
        onPressed:
            (aadhaarFront != null && aadhaarBack != null && panCard != null)
                // ? () {
                //     Get.to(LoginScreen());
                //   }
                // : null,
                ? () async {
                    Get.dialog(
                        Dialog(
                          backgroundColor: blue,
                          child: Container(
                            height: 100,
                            child: SpinKitSpinningLines(
                              color: Colors.white,
                              lineWidth: 3,
                            ),
                          ),
                        ),
                        barrierDismissible: false);
                    var data = await APIService().uploadOwnerDocuments(
                        aadhaarFront,
                        aadhaarBack,
                        panCard,
                        passbook,
                        rentalAgreement1,
                        rentalAgreement2);
                    print(data);
                    if (data["statusCode"] == 1) {
                      Fluttertoast.showToast(
                          msg: 'Registered Successfully', fontSize: 18);
                      Get.offAll(ThankYouScreen());
                      print('===success===');
                    } else {
                      print('===failed===');
                    }
                  }
                : null,
        // onPressed: () {
        //   Get.to(LoginScreen());
        // },
        child: Container(
          width: double.infinity,
          height: 40,
          child: Center(
            child: Text(
              'Submit',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ));
  }

  buildBottomSheet() {
    return Get.bottomSheet(Container(
      height: 60,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton.icon(
              onPressed: () {
                Get.back();
                pickImage(0);
              },
              icon: Icon(
                Icons.camera_outlined,
                color: green,
                size: 30,
              ),
              label: Text(
                'Camera',
                style: TextStyle(
                    color: blue, fontSize: 20, fontWeight: FontWeight.bold),
              )),
          TextButton.icon(
              onPressed: () {
                Get.back();
                pickImage(1);
              },
              icon: Icon(
                Icons.image_outlined,
                color: green,
                size: 30,
              ),
              label: Text(
                'Gallery',
                style: TextStyle(
                    color: blue, fontSize: 20, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    ));
  }
}
