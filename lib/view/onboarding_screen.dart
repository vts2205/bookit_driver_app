import 'package:bookit_driver_app/constants/colors.dart';
import 'package:bookit_driver_app/controllers/onboarding_controller.dart';
import 'package:bookit_driver_app/view/terms_conditions_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = OnboardingController();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                controller: _controller.pageController,
                onPageChanged: _controller.selectedpageIndex,
                itemCount: _controller.onboardingPages.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 300,
                          height: 350,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      _controller.onboardingPages[index].image),
                                  fit: BoxFit.fill)),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _controller.onboardingPages[index].title,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: Text(
                            _controller.onboardingPages[index].description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 24, color: Colors.black54),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            Positioned(
              bottom: 20,
              left: 20,
              child: Row(
                  children: List.generate(
                      _controller.onboardingPages.length,
                      (index) => Obx(() {
                            return Container(
                              margin: const EdgeInsets.all(4),
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                  color: _controller.selectedpageIndex.value ==
                                          index
                                      ? green
                                      : Colors.black26,
                                  shape: BoxShape.circle),
                            );
                          }))),
            ),
            Positioned(
                right: 20,
                bottom: 20,
                child: FloatingActionButton(
                    backgroundColor: green,
                    elevation: 0,
                    onPressed: () {
                      _controller.isLastPage
                          ? Get.offAll(const TermsConditionsScreen())
                          : _controller.ForwardAction();
                    },
                    child: Obx(() {
                      return Text(
                        _controller.isLastPage ? 'Start' : 'Next',
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      );
                    })))
          ],
        ),
      ),
    );
  }
}
