import 'package:bookit_driver_app/constants/colors.dart';
import 'package:bookit_driver_app/controllers/package_selection_scontroller.dart';
import 'package:bookit_driver_app/controllers/vehicle_selection_controller.dart';
import 'package:bookit_driver_app/mainScreens/main_screen.dart';
import 'package:bookit_driver_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarSelectionScreen extends StatelessWidget {
  CarSelectionScreen({Key? key}) : super(key: key);

  VehicleSelectionController vehicleSelectionController =
      Get.put(VehicleSelectionController());
  PackageSelectionController packageSelectionController =
      Get.put(PackageSelectionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'Vehicles and Packages'),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: blue.withOpacity(0.2)),
                    child: const Center(
                      child: Text('Select Your Vehicle',
                          style: TextStyle(fontSize: 20)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(() {
                    return RadioListTile(
                      activeColor: green,
                      value: 'Mini',
                      groupValue:
                          vehicleSelectionController.selectedVehicle.value,
                      onChanged: (value) {
                        vehicleSelectionController.onChangeVehicle(value);
                      },
                      title: const Text(
                        'Mini',
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  }),
                  Obx(() {
                    return RadioListTile(
                      activeColor: green,
                      value: 'Sedan',
                      groupValue:
                          vehicleSelectionController.selectedVehicle.value,
                      onChanged: (value) {
                        vehicleSelectionController.onChangeVehicle(value);
                      },
                      title: const Text(
                        'Sedan',
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  }),
                  Obx(() {
                    return RadioListTile(
                      activeColor: green,
                      value: 'XUV',
                      groupValue:
                          vehicleSelectionController.selectedVehicle.value,
                      onChanged: (value) {
                        vehicleSelectionController.onChangeVehicle(value);
                      },
                      title: const Text(
                        'XUV',
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  }),
                  const SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: blue.withOpacity(0.2)),
                    child:const Center(
                      child: Text('Select Your Package',
                          style: TextStyle(fontSize: 20)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(() {
                    return RadioListTile(
                      activeColor: green,
                      value: 'Local',
                      groupValue:
                          packageSelectionController.selectedPackage.value,
                      onChanged: (value) {
                        packageSelectionController.onChangePackage(value);
                      },
                      title: const Text(
                        'Local',
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  }),
                  Obx(() {
                    return RadioListTile(
                      activeColor: green,
                      value: 'Rental',
                      groupValue:
                          packageSelectionController.selectedPackage.value,
                      onChanged: (value) {
                        packageSelectionController.onChangePackage(value);
                      },
                      title: const Text(
                        'Rental',
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  }),
                  Obx(() {
                    return RadioListTile(
                      activeColor: green,
                      value: 'Outstation',
                      groupValue:
                          packageSelectionController.selectedPackage.value,
                      onChanged: (value) {
                        packageSelectionController.onChangePackage(value);
                      },
                      title: const Text(
                        'Outstation',
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  }),
                  Obx(() {
                    return RadioListTile(
                      activeColor: green,
                      value: 'Tour',
                      groupValue:
                          packageSelectionController.selectedPackage.value,
                      onChanged: (value) {
                        packageSelectionController.onChangePackage(value);
                      },
                      title: const Text(
                        'Tour',
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  }),
                ],
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: blue.withOpacity(0.2), elevation: 0),
                      onPressed: () {
                        Get.to(MainScreen());
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Text('Submit',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
