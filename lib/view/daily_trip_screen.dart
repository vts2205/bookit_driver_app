import 'package:bookit_driver_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';


class DailyTripScreen extends StatelessWidget {
  const DailyTripScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: '7 April'),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              const Text('12:25 PM',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: const [
                      Text(
                        'Invoice Number :',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'ABCD1234',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              const Card(
                  child: Padding(
                padding: EdgeInsets.only(top: 5),
                child: ListTile(
                  title: Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      'Pickup Location',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  subtitle: Text(
                    'Pickup Address',
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Text(
                    '10:15 AM',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )),
              const Card(
                  child: Padding(
                padding: EdgeInsets.only(top: 5),
                child: ListTile(
                  title: Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      'Drop Location',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  subtitle: Text(
                    'Drop Address',
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Text(
                    '05:15 PM',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Total cash collected :',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '100',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Payment for company :',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '- 15',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'GST :',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '- 5',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Conveyance fee :',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '- 10',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Net earnings :',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '70',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
