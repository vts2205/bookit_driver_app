import 'package:bookit_driver_app/mainScreens/main_screen.dart';
import 'package:bookit_driver_app/view/login_screen.dart';
import 'package:bookit_driver_app/view/notification_screen.dart';
import 'package:bookit_driver_app/view/profile_screen.dart';
import 'package:bookit_driver_app/view/reports_screen.dart';
import 'package:bookit_driver_app/view/terms_and_conditions_screen.dart';
import 'package:bookit_driver_app/view/transaction_history_screen.dart';
import 'package:bookit_driver_app/view/trip_details_screen.dart';
import 'package:bookit_driver_app/view/wallet_screen.dart';
import 'package:bookit_driver_app/widgets/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                height: 30,
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Get.to(ProfileScreen());
                },
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 35,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: const [
                        Text(
                          "name",
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          "number",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(height: 30),
              MenuItem(
                  title: 'Dashboard',
                  icon: Icons.analytics_outlined,
                  onTap: () {
                    Get.to(MainScreen());
                  },
                  color: Colors.black,
                  size: 20),
              MenuItem(
                  title: 'Trip Details',
                  icon: Icons.drive_eta_outlined,
                  onTap: () {
                    Get.to(const TripDetailsScreen());
                  },
                  color: Colors.black,
                  size: 20),
              MenuItem(
                  title: 'Notification',
                  icon: Icons.notification_important_outlined,
                  onTap: () {
                    Get.to(const NotificationScreen());
                  },
                  color: Colors.black,
                  size: 20),
              MenuItem(
                  title: 'Reports',
                  icon: Icons.assignment_outlined,
                  onTap: () {
                    Get.to(const ReportsScreen());
                  },
                  color: Colors.black,
                  size: 20),
              MenuItem(
                  title: 'Wallet',
                  icon: Icons.account_balance_wallet_outlined,
                  onTap: () {
                    Get.to(const WalletScreen());
                  },
                  color: Colors.black,
                  size: 20),
              MenuItem(
                  title: 'Transaction History',
                  icon: Icons.history,
                  onTap: () {
                    Get.to(const TransactionHistoryScreen());
                  },
                  color: Colors.black,
                  size: 20),
              MenuItem(
                  title: 'Terms and Conditions',
                  icon: Icons.description,
                  onTap: () {
                    Get.to(const TermsAndConditionsScreen());
                  },
                  color: Colors.black,
                  size: 20),
              MenuItem(
                  title: 'Logout',
                  icon: Icons.logout,
                  onTap: () {
                    Get.offAll(const LoginScreen());
                  },
                  color: Colors.black,
                  size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
