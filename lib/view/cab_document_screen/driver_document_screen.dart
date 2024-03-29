import 'dart:io';
import 'package:bookit_driver_app/service/apiservice.dart';
import 'package:bookit_driver_app/view/cab_document_screen/owner_document_screen.dart';
import 'package:bookit_driver_app/view/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants/colors.dart';

class DriverDocumentScreen extends StatefulWidget {
  const DriverDocumentScreen({Key? key}) : super(key: key);

  @override
  State<DriverDocumentScreen> createState() => _DriverDocumentScreenState();
}

class _DriverDocumentScreenState extends State<DriverDocumentScreen> {
  File? image;

  int clickedDocType = 0;

  File? profileImage;
  File? licenseFront;
  File? licenseBack;
  File? aadhaarFront;
  File? aadhaarBack;

  void pickImage(int type) async {
    File? imageFile;
    if (type == 0) {
      imageFile = await cameraImage();
    } else {
      imageFile = await galleryImage();
    }
    switch (clickedDocType) {
      case 1:
        {
          setState(() {
            profileImage = imageFile;
          });
        }
        break;
      case 2:
        {
          setState(() {
            licenseFront = imageFile;
          });
        }
        break;
      case 3:
        {
          setState(() {
            licenseBack = imageFile;
          });
        }
        break;
      case 4:
        {
          setState(() {
            aadhaarFront = imageFile;
          });
        }
        break;
      case 5:
        {
          setState(() {
            aadhaarBack = imageFile;
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Driver Documents',
          style:
              TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: blue),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                openWhatsappChat();
              },
              icon: Image.asset('assets/icons/whatsapp.png')),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                launch("tel://+918110800811");
              },
              child: Image.asset(
                'assets/icons/callcenter.png',
                width: 40,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              buildFileUploadButton('Profile Photo', 1),
              const SizedBox(height: 20),
              buildFileUploadButton('License front', 2),
              const SizedBox(height: 20),
              buildFileUploadButton('License back', 3),
              const SizedBox(height: 20),
              buildFileUploadButton('Aadhaar front', 4),
              const SizedBox(height: 20),
              buildFileUploadButton('Aadhaar back', 5),
              const SizedBox(height: 20),
              buildSubmitButton()
            ],
          ),
        ),
      ),
    );
  }

  buildFileUploadButton(String title, int type) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 18, color: green)),
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
          return profileImage != null
              ? Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                  child: Image.file(
                    profileImage!,
                    fit: BoxFit.fill,
                  ))
              : Text('No File');
        }
      case 2:
        {
          return licenseFront != null
              ? Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                  child: Image.file(
                    licenseFront!,
                    fit: BoxFit.fill,
                  ))
              : Text('No File');
        }
      case 3:
        {
          return licenseBack != null
              ? Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                  child: Image.file(
                    licenseBack!,
                    fit: BoxFit.fill,
                  ))
              : Text('No File');
        }
      case 4:
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

      case 5:
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
        onPressed: (profileImage != null &&
                licenseFront != null &&
                licenseBack != null &&
                aadhaarFront != null &&
                aadhaarBack != null)
            // ? () {
            //     Get.to(OwnerDocumentScreen());
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
                var data = await APIService().uploadDriverDocuments(
                    profileImage,
                    licenseFront,
                    licenseBack,
                    aadhaarFront,
                    aadhaarBack);
                print(data);
                if (data["statusCode"] == 1) {
                  Get.offAll(OwnerDocumentScreen());
                  print('===success===');
                } else {
                  print('===failed===');
                }
              }
            : null,
        // onPressed: () {
        //   Get.to(OwnerDocumentScreen());
        // },
        child: Container(
          width: double.infinity,
          height: 40,
          child: Center(
            child: Text(
              'Next',
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

  void openWhatsappChat() async {
    var url = 'https://wa.me/+918110800811';
    await launch(url);
  }
}
