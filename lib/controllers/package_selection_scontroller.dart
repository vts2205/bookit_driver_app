import 'package:get/get.dart';

class PackageSelectionController extends GetxController {
  var selectedPackage = "".obs;

  onChangePackage(var package) {
    selectedPackage.value = package;
  }
}
