import 'package:bookit_driver_app/constants/colors.dart';
import 'package:bookit_driver_app/widgets/appbar_widget.dart';
import 'package:bookit_driver_app/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';


class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'Transaction History'),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: ListTile(
                  title: const Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text('04/04/2022 10:15 AM',
                        style: TextStyle(fontSize: 20)),
                  ),
                  subtitle: const Text('Gpay', style: TextStyle(fontSize: 20)),
                  trailing: Text(
                    '+ 1000',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: green),
                  ),
                ),
              ),
              const Card(
                child: ListTile(
                  title: Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text('09/04/2022 12:30 PM',
                        style: TextStyle(fontSize: 20)),
                  ),
                  subtitle: Text('Wallet', style: TextStyle(fontSize: 20)),
                  trailing: Text(
                    '- 300',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
