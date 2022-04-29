import 'package:bookit_driver_app/constants/colors.dart';
import 'package:bookit_driver_app/view/car_selection_screen.dart';
import 'package:bookit_driver_app/view/register_screen.dart';
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
                Container(
                  width: 200,
                  height: 200,
                  child: Image.asset(
                    'assets/logo/bookitlogo.png',
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 30),
                Text('Login To Start Your Ride',
                    style: TextStyle(
                        fontSize: 25,
                        color: green,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 30),
                TextField(
                  keyboardType: TextInputType.number,
                  cursorColor: green,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
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
                const SizedBox(height: 10),
                const Divider(thickness: 2),
                const SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.number,
                  cursorColor: green,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
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
                const SizedBox(height: 10),
                const Divider(thickness: 2),
                const SizedBox(height: 10),
                PinCodeTextField(
                  autofocus: true,
                  highlight: true,
                  highlightColor: green,
                  defaultBorderColor: Colors.black,
                  maxLength: 4,
                  pinBoxWidth: 40,
                  pinBoxHeight: 50,
                  hasUnderline: true,
                  wrapAlignment: WrapAlignment.spaceAround,
                  pinBoxDecoration:
                      ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                  pinBoxRadius: 5,
                  pinTextStyle: const TextStyle(fontSize: 22.0),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: blue),
                    onPressed: () {
                      Get.to(CarSelectionScreen());
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: const Center(
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 23, color: Colors.white),
                        ),
                      ),
                    )),
                const SizedBox(height: 10),
                TextButton(
                    onPressed: () {
                      Get.to(RegisterScreen());
                    },
                    child: Text(
                      'Don\'t have an account? Register Now',
                      style: TextStyle(
                          color: blue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
