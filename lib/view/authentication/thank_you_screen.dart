import 'package:bookit_driver_app/constants/colors.dart';
import 'package:bookit_driver_app/widgets/gradient_text_widget.dart';
import 'package:flutter/material.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GradientText('THANK YOU FOR',
                style: TextStyle(
                    letterSpacing: 3,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
                gradient: LinearGradient(
                    colors: [blue, green],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            SizedBox(height: 10),
            GradientText('REGISTERING',
                style: TextStyle(
                    letterSpacing: 3,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
                gradient: LinearGradient(
                    colors: [blue, green],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            SizedBox(height: 10),
            GradientText('WITH US',
                style: TextStyle(
                    letterSpacing: 3,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
                gradient: LinearGradient(
                    colors: [blue, green],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            SizedBox(height: 40),
            Image(image: AssetImage('assets/logo/bookit.png')),
            SizedBox(height: 40),
            GradientText('For More Details',
                style: TextStyle(
                    letterSpacing: 3,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
                gradient: LinearGradient(colors: [
                  green,
                  blue,
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            SizedBox(height: 10),
            GradientText('Contact Driver Care',
                style: TextStyle(
                    letterSpacing: 3,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
                gradient: LinearGradient(
                    colors: [green, blue],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            SizedBox(height: 10),
            GradientText('8110 800 811',
                style: TextStyle(
                    letterSpacing: 3,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
                gradient: LinearGradient(colors: [
                  green,
                  blue,
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          ],
        ),
      )),
    );
  }
}
