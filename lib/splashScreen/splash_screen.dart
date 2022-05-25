import 'dart:async';
import 'package:bookit_driver_app/constants/colors.dart';
import 'package:bookit_driver_app/view/authentication/login_screen.dart';
import 'package:flutter/material.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  startTimer() {
    Timer(const Duration(seconds: 3), () async {
      // if (await fAuth.currentUser != null) {
      //   currentFirebaseUser = fAuth.currentUser;
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (c) => MainScreen()));
      // } else {
      Navigator.push(context, MaterialPageRoute(builder: (c) => LoginScreen()));
      // }
    });
  }

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [blue.withOpacity(0.4), green.withOpacity(0.4)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo/logo.png",
                width: 250,
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Text(
                    "WELCOME",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: green),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "TO",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: green),
                  ),
                  SizedBox(height: 20),
                  Image.asset(
                    "assets/logo/bookit.png",
                    width: 250,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
