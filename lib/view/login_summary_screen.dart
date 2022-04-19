import 'package:bookit_driver_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';


class LoginSummaryScreen extends StatelessWidget {
  const LoginSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'Login Summary'),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: const [
                  Text('Driver ID :', style: TextStyle(fontSize: 22)),
                  SizedBox(width: 5),
                  Text('ABCD1234',
                      style: TextStyle(fontSize: 20, color: Colors.black54)),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Text('Driver Name :', style: TextStyle(fontSize: 22)),
                  SizedBox(width: 5),
                  Text('Xyz',
                      style: TextStyle(fontSize: 20, color: Colors.black54)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Login Time :', style: TextStyle(fontSize: 22)),
                          SizedBox(width: 5),
                          Text('09:00 AM',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black54)),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Logout Time :', style: TextStyle(fontSize: 22)),
                          SizedBox(width: 5),
                          Text('09:00 PM',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black54)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Login Location :',
                            style: TextStyle(fontSize: 22)),
                        SizedBox(height: 5),
                        Text('Login Address',
                            maxLines: 10,
                            style:
                                TextStyle(fontSize: 20, color: Colors.black54)),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Logout Location :',
                            style: TextStyle(fontSize: 22)),
                        SizedBox(height: 5),
                        Text('Logout Address',
                            maxLines: 10,
                            style:
                                TextStyle(fontSize: 20, color: Colors.black54)),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Total Login Hours :',
                          style: TextStyle(fontSize: 22)),
                      SizedBox(width: 5),
                      Text('12 hours 30 mins',
                          style:
                              TextStyle(fontSize: 20, color: Colors.black54)),
                    ],
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
