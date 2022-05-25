import 'dart:io';
import 'package:bookit_driver_app/service/apiservice.dart';
import 'package:bookit_driver_app/view/cab_document_screen/driver_document_screen.dart';
import 'package:bookit_driver_app/view/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants/colors.dart';

class CarDocumentScreen extends StatefulWidget {
  CarDocumentScreen({Key? key}) : super(key: key);

  @override
  State<CarDocumentScreen> createState() => _CarDocumentScreenState();
}

class _CarDocumentScreenState extends State<CarDocumentScreen> {
  File? image;
  int clickedDocType = 0;

  File? frontImage;
  File? chaseNumberImage;
  File? rcFront;
  File? rcBack;
  File? insurance;
  File? fcCopy;

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
            frontImage = imageFile;
          });
        }
        break;
      case 2:
        {
          setState(() {
            chaseNumberImage = imageFile;
          });
        }
        break;
      case 3:
        {
          setState(() {
            rcFront = imageFile;
          });
        }
        break;
      case 4:
        {
          setState(() {
            rcBack = imageFile;
          });
        }
        break;
      case 5:
        {
          setState(() {
            insurance = imageFile;
          });
        }
        break;
      case 6:
        {
          setState(() {
            fcCopy = imageFile;
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
                'Car Documents',
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: blue),
              ),
              const SizedBox(height: 20),
              buildFileUploadButton('Car Front image', 1),
              const SizedBox(height: 20),
              buildFileUploadButton('Chase number Image', 2),
              const SizedBox(height: 20),
              buildFileUploadButton('RC Book front', 3),
              const SizedBox(height: 20),
              buildFileUploadButton('RC Book back', 4),
              const SizedBox(height: 20),
              buildFileUploadButton('Insurance', 5),
              const SizedBox(height: 20),
              buildFileUploadButton('FC copy(optional)', 6),
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
          return frontImage != null
              ? Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                  child: Image.file(
                    frontImage!,
                    fit: BoxFit.cover,
                  ))
              : Text('No File');
        }
      case 2:
        {
          return chaseNumberImage != null
              ? Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                  child: Image.file(
                    chaseNumberImage!,
                    fit: BoxFit.fill,
                  ))
              : Text('No File');
        }
      case 3:
        {
          return rcFront != null
              ? Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                  child: Image.file(
                    rcFront!,
                    fit: BoxFit.fill,
                  ))
              : Text('No File');
        }
      case 4:
        {
          return rcBack != null
              ? Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                  child: Image.file(
                    rcBack!,
                    fit: BoxFit.fill,
                  ))
              : Text('No File');
        }

      case 5:
        {
          return insurance != null
              ? Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                  child: Image.file(
                    insurance!,
                    fit: BoxFit.fill,
                  ))
              : Text('No File');
        }
      case 6:
        {
          return fcCopy != null
              ? Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                  child: Image.file(
                    fcCopy!,
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
        // onPressed: () {
        //   final databaseReference = FirebaseDatabase.instance.reference();
        //   databaseReference
        //       .child("flutterDevsTeam1")
        //       .set({'name': 'Deepak Nishad', 'description': 'Team Lead'});
        //   databaseReference.once().then((DataSnapshot snapshot) {
        //     print('Data : ${snapshot.value}');
        //   });
        // },
        onPressed: (frontImage != null &&
                chaseNumberImage != null &&
                rcFront != null &&
                rcBack != null &&
                insurance != null)
            // ? () {
            //     Get.to(DriverDocumentScreen());
            //   }
            // : null,
            ? () async {
                //firebase
                // if (imageuser != null) {

                // var urlList = [];
                // var imagelist = [];
                // imagelist.add(frontImage);
                // imagelist.add(chaseNumberImage);
                // imagelist.add(rcFront);
                // imagelist.add(rcBack);
                // imagelist.add(insurance);
                // imagelist.add(fcCopy);
                // imagelist.forEach((element) async {
                //   var timestamp =
                //       DateTime.now().millisecondsSinceEpoch.toString();
                //   final Reference storageRef = FirebaseStorage.instance
                //       .ref()
                //       .child('${'driver_1'}-$timestamp.jpg');
                //
                //   final taskSnapshot = await storageRef.putFile(element!);
                //   var url = await taskSnapshot.ref.getDownloadURL();
                //   urlList.add(url);
                // });
                // await FirebaseFirestore.instance
                //     .collection('users')
                //     .doc('hjdhjhjd')
                //     .set({
                //   'username': 'username',
                //   'email': 'email',
                //   'laundryBagNo': 'laundryBagNo',
                //   'image_url': 'url',
                //   'userId': 'userCredential.user.uid' //this_one
                // });

                // var databaseReference = FirebaseDatabase.instance.reference();
                // databaseReference
                //     .child("flutterDevsTeam1")
                //     .set({'name': 'Deepak Nishad', 'description': 'Team Lead'});

                // var documentReference = FirebaseFirestore.instance
                //     .collection('data')
                //     .doc('driver_1');
                // await FirebaseFirestore.instance
                //     .runTransaction((transaction) async {
                //   transaction.update(documentReference, {
                //     'frontimage': 'urlList[0]',
                //     'chaseNumberImage': 'urlList[1]',
                //     'rcFront': 'urlList[2]',
                //     'rcBack': ' urlList[3]',
                //     'insurance': 'urlList[4]',
                //     'fcCopy': ' urlList[5]',
                //   });
                // });
                //   }
                // : null,

                //api
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
                var data = await APIService().uploadCarDocuments(frontImage,
                    chaseNumberImage, rcFront, rcBack, insurance, fcCopy);
                print(data);
                if (data["statusCode"] == 1) {
                  Get.offAll(DriverDocumentScreen());
                  print('===success===');
                } else {
                  print('===failed===');
                }
              }
            : null,
        // onPressed: () {
        //
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
}
