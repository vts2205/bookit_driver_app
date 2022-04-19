import 'package:bookit_driver_app/models/onboarding_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var selectedpageIndex = 0.obs;
  bool get isLastPage => selectedpageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  ForwardAction() {
    if (isLastPage) {
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('assets/images/introimg1.png', 'Accept a Ride',
        'Accept the ride as soon as you receive request from customer'),
    OnboardingInfo('assets/images/introimg2.png', 'Choose your Place',
        'Choose the short distance to reach your destination faster'),
    OnboardingInfo('assets/images/introimg3.png', '24/7 Service',
        'Anywhere Anytime at your service')
  ];
}
