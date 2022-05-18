import 'package:bookit_driver_app/constants/colors.dart';
import 'package:bookit_driver_app/service/apiservice.dart';
import 'package:bookit_driver_app/view/cab_document_screen/car_documents_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

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
            child: Column(
              children: [
                Text(
                  'Register Now',
                  style: TextStyle(
                      fontSize: 23, fontWeight: FontWeight.bold, color: blue),
                ),
                const SizedBox(height: 30),
                buildTextFormField('Enter your name', name),
                const SizedBox(height: 30),
                buildTextFormField('Enter your phone number', driverphone),
                const SizedBox(height: 30),
                buildTextFormField('Enter owner name', ownername),
                const SizedBox(height: 30),
                buildTextFormField('Enter owner phone number', ownerphone),
                const SizedBox(height: 30),
                buildTextFormField('Enter your location', location),
                const SizedBox(height: 30),
                buildTextFormField('Enter your license number', license),
                const SizedBox(height: 30),
                buildTextFormField('Enter your license expiry date', date),
                const SizedBox(height: 30),
                //buildTextFormField('Enter your fcm', date),
                buildNextButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildTextFormField(String text, controller) {
    return TextFormField(
      controller: controller,
      cursorColor: green,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: green, width: 2)),
          hintText: text),
    );
  }

  buildNextButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: blue),
        // onPressed: () async {
        //   print("botton clicked");
        //   var data = await APIService().RegisterDriver(
        //       name.text,
        //       driverphone.text,
        //       ownername.text,
        //       ownerphone.text,
        //       location.text,
        //       license.text,
        //       date.text);
        //   print(data['body']['Token']);
        //   if (data['statusCode'] == 1) {
        //     //box.write("token", data["body"]["Token"]);
        //     Get.to(CarDocumentScreen());
        //     print('====success====');
        //   } else {
        //     print('====failed====');
        //   }
        // },
        onPressed: () {
          Get.to(CarDocumentScreen());
        },
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
