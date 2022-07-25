import 'package:bookit_driver_app/constants/colors.dart';
import 'package:bookit_driver_app/models/cancelled_trip_model.dart';
import 'package:bookit_driver_app/service/apiservice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CancelledListScreen extends StatefulWidget {
  const CancelledListScreen({Key? key}) : super(key: key);

  @override
  State<CancelledListScreen> createState() => _CancelledListScreenState();
}

class _CancelledListScreenState extends State<CancelledListScreen> {
  CancelledTripModel? cancelledTripModel;

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    cancelledTripModel = await APIService().cancelledTripList();
    if (cancelledTripModel != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Text(
                'February 2022',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 5),
              isLoading == false
                  ? Center(child: CircularProgressIndicator(color: green))
                  : Expanded(
                      child: ListView.builder(
                        itemCount: cancelledTripModel
                            ?.body?.tripHistoryCancelled?.length,
                        itemBuilder: (context, index) {
                          return Container();
                          //   ListWidget(
                          //   item: ListItemModel.list[index],
                          //   onTap: () {
                          //     Get.to(const UpcomingScreen());
                          //   },
                          // );
                        },
                      ),
                    ),
            ],
          )),
    );
  }
}
