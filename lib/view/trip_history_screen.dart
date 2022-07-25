import 'package:bookit_driver_app/constants/colors.dart';
import 'package:bookit_driver_app/view/trip_tab_screens/all_list_screen.dart';
import 'package:bookit_driver_app/view/trip_tab_screens/completed_list_screen.dart';
import 'package:bookit_driver_app/view/trip_tab_screens/cancelled_list_screen.dart';
import 'package:bookit_driver_app/widgets/drawer_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TripHistoryScreen extends StatelessWidget {
  const TripHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
        "Trip History",
        style:
            TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: blue),
      ),
      centerTitle: true,
      bottom: TabBar(
          labelColor: blue,
          labelStyle:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          indicatorColor: green,
          indicatorWeight: 5,
          unselectedLabelColor: Colors.black54,
          unselectedLabelStyle:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Completed'),
            Tab(text: 'Cancelled')
          ]),
    );
  }

  buildTabBarView() {
    return TabBarView(children: [
      AllListScreen(),
      CompletedListScreen(),
      CancelledListScreen()
    ]);
  }
}
