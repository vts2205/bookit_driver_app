import 'package:bookit_driver_app/constants/colors.dart';
import 'package:bookit_driver_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMoneyScreen extends StatelessWidget {
  const AddMoneyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'Add Money'),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(height: 30),
            buildAmount(context),
            const SizedBox(height: 40),
            buildAmountField(),
            const SizedBox(height: 40),
            buildAddMoneyButton()
          ],
        ),
      ),
    );
  }

  buildAmount(BuildContext context) {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: const [
            SizedBox(height: 30),
            Text('RS 1000',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
            SizedBox(height: 10),
            Text('Available Balance',
                style: TextStyle(fontSize: 15, color: Colors.black54)),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  buildAmountField() {
    return TextField(
      cursorColor: Colors.black54,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(5)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(5)),
          hintText: 'Enter your amount',
          hintStyle: const TextStyle(fontSize: 18)),
    );
  }

  buildAddMoneyButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: blue, padding: const EdgeInsets.all(10)),
      onPressed: () {
        /// ippopay screen
        // Get.to();
      },
      child: const Text(
        'Add Money',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
