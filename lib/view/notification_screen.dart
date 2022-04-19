import 'package:bookit_driver_app/constants/colors.dart';
import 'package:bookit_driver_app/view/notification_tab_screens/all_notification_screen.dart';
import 'package:bookit_driver_app/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'notification_tab_screens/trip_info_screen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: buildAppbar(),
          drawer: const DrawerWidget(),
          body: buildTabBarView()),
    );
  }

  buildAppbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
      title: Text(
        "Notification",
        style:
            TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: blue),
      ),
      centerTitle: true,
      bottom: TabBar(
          labelColor: blue,
          labelStyle:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          indicatorColor: green,
          indicatorWeight: 5,
          unselectedLabelColor: Colors.black54,
          unselectedLabelStyle:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Trip Info'),
          ]),
    );
  }

  buildTabBarView() {
    return const TabBarView(
        children: [AllNotificationScreen(), TripInfoScreen()]);
  }
}
