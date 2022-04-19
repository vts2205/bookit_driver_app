import 'package:bookit_driver_app/constants/colors.dart';
import 'package:bookit_driver_app/view/login_screen.dart';
import 'package:bookit_driver_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppbarWidget(title: 'Terms And Conditions'),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
            ),
            Positioned(
                bottom: 10,
                left: 180,
                right: 180,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: blue,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
                    onPressed: () {
                      Get.to(LoginScreen());
                    },
                    child: Text(
                      'Agree',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )))
          ],
        ),
      ),
    );
  }
}
