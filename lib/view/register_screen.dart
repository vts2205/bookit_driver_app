import 'package:bookit_driver_app/constants/colors.dart';
import 'package:bookit_driver_app/view/car_documents_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController license = TextEditingController();
  TextEditingController date = TextEditingController();

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
                      fontSize: 25, fontWeight: FontWeight.bold, color: blue),
                ),
                const SizedBox(height: 30),
                buildTextFormField('Enter your name', name),
                const SizedBox(height: 30),
                buildTextFormField('Enter your email address', email),
                const SizedBox(height: 30),
                buildTextFormField('Enter your phone number', phone),
                const SizedBox(height: 30),
                buildTextFormField('Enter your location', location),
                const SizedBox(height: 30),
                buildTextFormField('Enter your license number', license),
                const SizedBox(height: 30),
                buildTextFormField('Enter your license expiry date', date),
                const SizedBox(height: 50),
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
