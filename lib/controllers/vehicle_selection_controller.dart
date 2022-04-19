import 'package:get/get.dart';

class VehicleSelectionController extends GetxController {
  var selectedVehicle = "".obs;

  onChangeVehicle(var vehicle) {
    selectedVehicle.value = vehicle;
  }
}
