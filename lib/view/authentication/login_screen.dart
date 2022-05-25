import 'package:bookit_driver_app/constants/colors.dart';
import 'package:bookit_driver_app/view/authentication/verify_otp_screen.dart';
import 'package:bookit_driver_app/view/authentication/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController contact = TextEditingController();

  void submit() async {
    if (contact.text == "") return;

    var appSignatureID = await SmsAutoFill().getAppSignature;
    Map sendOtpData = {
      "mobile_number": contact.text,
      "app_signature_id": appSignatureID
    };
    print(sendOtpData);
    Get.to(VerifyOTPScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    width: 250,
                    height: 250,
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
                  TextFormField(
                    controller: contact,
                    keyboardType: TextInputType.number,
                    cursorColor: green,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: green, width: 2),
                      ),
                      hintText: 'Enter Your Phone Number',
                    ),
                    validator: (value) {
                      if (value?.length != 10)
                        return 'Mobile Number must be of 10 digit';
                      else
                        return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  const Divider(thickness: 2),
                  const SizedBox(height: 10),
                  TextFormField(
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
                  // const SizedBox(height: 10),
                  // PinCodeTextField(
                  //   autofocus: true,
                  //   highlight: true,
                  //   highlightColor: green,
                  //   defaultBorderColor: Colors.black,
                  //   maxLength: 4,
                  //   pinBoxWidth: 40,
                  //   pinBoxHeight: 50,
                  //   hasUnderline: true,
                  //   wrapAlignment: WrapAlignment.spaceAround,
                  //   pinBoxDecoration:
                  //       ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                  //   pinBoxRadius: 5,
                  //   pinTextStyle: const TextStyle(fontSize: 22.0),
                  // ),
                  const SizedBox(height: 20),
                  // ElevatedButton(
                  //     style: ElevatedButton.styleFrom(primary: blue),
                  //     onPressed: () {
                  //       if (formKey.currentState!.validate()) {
                  //         Fluttertoast.showToast(
                  //             msg: 'Logged In Successfully', fontSize: 18);
                  //         Get.to(MainScreen());
                  //       } else {
                  //         Fluttertoast.showToast(
                  //             msg: 'Enter Required Fields', fontSize: 18);
                  //       }
                  //     },
                  //     //submit,
                  //     child: Container(
                  //       width: MediaQuery.of(context).size.width,
                  //       height: 50,
                  //       child: const Center(
                  //         child: Text(
                  //           'Login',
                  //           style: TextStyle(fontSize: 23, color: Colors.white),
                  //         ),
                  //       ),
                  //     )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: blue),
                      onPressed: () {
                        Get.to(RegisterScreen());
                      },
                      //submit,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: const Center(
                          child: Text(
                            'Register',
                            style: TextStyle(fontSize: 23, color: Colors.white),
                          ),
                        ),
                      )),
                  // const SizedBox(height: 10),
                  // TextButton(
                  //     onPressed: () {
                  //       Get.to(RegisterScreen());
                  //     },
                  //     child: Text(
                  //       'Don\'t have an account? Register Now',
                  //       style: TextStyle(
                  //           color: blue,
                  //           fontSize: 18,
                  //           fontWeight: FontWeight.bold),
                  //     ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
