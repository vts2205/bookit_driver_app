import 'package:bookit_driver_app/constants/colors.dart';
import 'package:bookit_driver_app/view/car_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Container(
                  width: 400,
                  height: 200,
                  child: Image.asset('assets/logo/driverlogo.png'),
                ),
                const SizedBox(height: 50),
                Text('Login To Start Your Ride',
                    style: TextStyle(
                        fontSize: 25,
                        color: green,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 50),
                TextField(
                  keyboardType: TextInputType.number,
                  cursorColor: green,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: green, width: 2),
                    ),
                    hintText: 'Enter Your Phone Number',
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(thickness: 2),
                const SizedBox(height: 20),
                TextField(
                  keyboardType: TextInputType.number,
                  cursorColor: green,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: green, width: 2),
                    ),
                    hintText: 'Enter Referral Code',
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(thickness: 2),
                const SizedBox(height: 20),
                PinCodeTextField(
                  autofocus: true,
                  highlight: true,
                  highlightColor: green,
                  defaultBorderColor: Colors.black,
                  maxLength: 4,
                  pinBoxWidth: 60,
                  pinBoxHeight: 60,
                  hasUnderline: true,
                  wrapAlignment: WrapAlignment.spaceAround,
                  pinBoxDecoration:
                      ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                  pinBoxRadius: 10,
                  pinTextStyle: const TextStyle(fontSize: 22.0),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: blue),
                    onPressed: () {
                      Get.to(CarSelectionScreen());
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: const Center(
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
