import 'package:bookit_driver_app/constants/colors.dart';
import 'package:bookit_driver_app/view/add_money_screen.dart';
import 'package:bookit_driver_app/widgets/appbar_widget.dart';
import 'package:bookit_driver_app/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'Wallet'),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text('RS 1000',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
            const SizedBox(height: 30),
            Row(
              children: [
                CircleAvatar(
                    radius: 30,
                    backgroundColor: blue.withOpacity(0.2),
                    child: Icon(Icons.account_balance_wallet,
                        size: 30, color: blue)),
                const Spacer(),
                const Text('Captain Wallet', style: TextStyle(fontSize: 20)),
                const Spacer(flex: 6),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: blue, padding: const EdgeInsets.all(15)),
                  onPressed: () {
                    Get.to(const AddMoneyScreen());
                  },
                  child: const Text(
                    'Add Money',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
