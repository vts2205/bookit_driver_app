import 'package:bookit_driver_app/constants/colors.dart';
import 'package:bookit_driver_app/service/apiservice.dart';
import 'package:bookit_driver_app/view/cab_document_screen/car_documents_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  final name = TextEditingController();
  final ownername = TextEditingController();
  final ownerphone = TextEditingController();
  final driverphone = TextEditingController();
  final location = TextEditingController();
  final license = TextEditingController();
  final date = TextEditingController();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Text(
                    'Register Now',
                    style: TextStyle(
                        fontSize: 23, fontWeight: FontWeight.bold, color: blue),
                  ),
                  const SizedBox(height: 30),
                  buildTextFormField('Enter your name', name, (value) {
                    if (value.isEmpty) {
                      return 'Enter a valid name';
                    }
                    return null;
                  }, TextInputType.text),
                  const SizedBox(height: 30),
                  buildTextFormField('Enter your phone number', driverphone,
                      (value) {
                    if (value?.length != 10)
                      return 'Mobile Number must be of 10 digit';
                    else
                      return null;
                  }, TextInputType.number),
                  const SizedBox(height: 30),
                  buildTextFormField('Enter owner name', ownername, (value) {
                    if (value.isEmpty) {
                      return 'Enter a valid name';
                    }
                    return null;
                  }, TextInputType.text),
                  const SizedBox(height: 30),
                  buildTextFormField('Enter owner phone number', ownerphone,
                      (value) {
                    if (value?.length != 10)
                      return 'Mobile Number must be of 10 digit';
                    else
                      return null;
                  }, TextInputType.number),
                  const SizedBox(height: 30),
                  buildTextFormField('Enter your district', location, (value) {
                    if (value.isEmpty) {
                      return 'Enter a valid district';
                    }
                    return null;
                  }, TextInputType.text),
                  const SizedBox(height: 30),
                  buildTextFormField('Enter your license number', license,
                      (value) {
                    if (value.isEmpty) {
                      return 'Enter a valid license number';
                    }
                    return null;
                  }, TextInputType.text),
                  const SizedBox(height: 30),
                  buildTextFormField('Enter your license expiry date', date,
                      (value) {
                    if (value.isEmpty) {
                      return 'Enter a valid expiry date';
                    }
                    return null;
                  }, TextInputType.datetime),
                  const SizedBox(height: 30),
                  //buildTextFormField('Enter your fcm', date),
                  buildNextButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildTextFormField(String text, controller, validator, keyboardType) {
    return TextFormField(
      controller: controller,
      cursorColor: green,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: green, width: 2)),
          hintText: text),
      validator: validator,
    );
  }

  buildNextButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: blue),
        onPressed: () async {
          print("botton clicked");
          if (formKey.currentState!.validate()) {
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
            var data = await APIService().RegisterDriver(
                name.text,
                driverphone.text,
                ownername.text,
                ownerphone.text,
                location.text,
                license.text,
                date.text);
            print(data['body']['Token']);
            if (data['statusCode'] == 1) {
              box.write('driverId', data['body']['driverId']);
              Fluttertoast.showToast(msg: data['message'], fontSize: 18);
              Get.offAll(CarDocumentScreen());
              print('====success====');
            } else {
              print('====failed====');
            }
          } else {
            Fluttertoast.showToast(msg: 'Enter Required Fields', fontSize: 18);
          }
        },
        // onPressed: () {
        //   Get.to(CarDocumentScreen());
        // },
        child: Container(
          width: double.infinity,
          height: 50,
          child: Center(
            child: Text(
              'Next',
              style: TextStyle(color: Colors.white, fontSize: 23),
            ),
          ),
        ));
  }
}
