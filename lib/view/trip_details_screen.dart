import 'package:bookit_driver_app/constants/colors.dart';
import 'package:bookit_driver_app/view/daily_trip_screen.dart';
import 'package:bookit_driver_app/widgets/appbar_widget.dart';
import 'package:bookit_driver_app/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TripDetailsScreen extends StatelessWidget {
  const TripDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppbarWidget(title: 'Trip Details'),
        drawer: const DrawerWidget(),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              const Text('Daily Trips',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Get.to(const DailyTripScreen());
                },
                child: Card(
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text('7 April 2022',
                          style: TextStyle(fontSize: 20, color: green)),
                    ),
                    subtitle: const Text('3 trips',
                        style: TextStyle(fontSize: 20, color: Colors.black54)),
                    trailing: const Icon(Icons.arrow_forward_ios,
                        color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
