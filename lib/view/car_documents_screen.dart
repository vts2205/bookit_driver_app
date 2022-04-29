import 'package:bookit_driver_app/view/login_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';

import '../constants/colors.dart';

class CarDocumentScreen extends StatelessWidget {
  const CarDocumentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 30),
            buildFileUploadButton('Photo :', 'Profileimage.png'),
            const SizedBox(height: 30),
            buildFileUploadButton('License :', 'License.pdf'),
            const SizedBox(height: 30),
            buildFileUploadButton('Aadhaar :', 'Aadhaar.pdf'),
            const SizedBox(height: 30),
            buildFileUploadButton('Pan :', 'Pan.pdf'),
            const SizedBox(height: 50),
            buildSubmitButton()
          ],
        ),
      )),
    );
  }

  buildFileUploadButton(String title, text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 22, color: green)),
        Text(text, style: TextStyle(fontSize: 20, color: Colors.black)),
        const SizedBox(height: 20),
        buildUploadButton()
      ],
    );
  }

  buildUploadButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: blue),
      onPressed: () async {
        final result = FilePicker.platform.pickFiles();
        if (result == null) return;
      },
      child: Text(
        'Upload',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  buildSubmitButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: green),
        onPressed: () {
          Get.to(LoginScreen());
        },
        child: Container(
          width: double.infinity,
          height: 50,
          child: Center(
            child: Text(
              'Submit',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ));
  }
}
