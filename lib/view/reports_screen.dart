import 'package:bookit_driver_app/view/login_summary_screen.dart';
import 'package:bookit_driver_app/view/total_hours_summary_screen.dart';
import 'package:bookit_driver_app/widgets/appbar_widget.dart';
import 'package:bookit_driver_app/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'Reports'),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: ListTile(
                  title: const Text('Login Summary',
                      style: TextStyle(fontSize: 18)),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Get.to(const LoginSummaryScreen());
                  },
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: ListTile(
                  title: const Text('Total Hours Summary',
                      style: TextStyle(fontSize: 18)),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Get.to(const TotalHoursSummaryScreen());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
