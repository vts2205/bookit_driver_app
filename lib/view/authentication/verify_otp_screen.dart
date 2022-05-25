import 'package:bookit_driver_app/view/car_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../../constants/colors.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({Key? key}) : super(key: key);

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> with CodeAutoFill {
  String codeValue = "";

  @override
  void codeUpdated() {
    print("Update code $code");
    setState(() {
      print("codeUpdated");
    });
  }

  @override
  void initState() {
    super.initState();
    listenOtp();
  }

  void listenOtp() async {
    await SmsAutoFill().unregisterListener();
    listenForCode();
    await SmsAutoFill().listenForCode;
    print("OTP listen Called");
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    print("unregisterListener");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 400,
              height: 300,
              child: Image.asset('assets/images/verifyotp.png'),
            ),
            const SizedBox(height: 30),
            PinFieldAutoFill(
              decoration: BoxLooseDecoration(
                  gapSpace: 40,
                  strokeWidth: 2,
                  strokeColorBuilder: FixedColorBuilder(blue)),
              currentCode: codeValue,
              codeLength: 4,
              onCodeChanged: (code) {
                print("onCodeChanged $code");
                setState(() {
                  codeValue = code.toString();
                });
              },
              onCodeSubmitted: (val) {
                print("onCodeSubmitted $val");
              },
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: blue,
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
                    onPressed: () {
                      print(codeValue);
                      Get.off(CarSelectionScreen());
                    },
                    child: const Text(
                      "Verify OTP",
                      style: TextStyle(fontSize: 20),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: green,
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
                    onPressed: listenOtp,
                    child: const Text("Resend OTP",
                        style: TextStyle(fontSize: 20)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
