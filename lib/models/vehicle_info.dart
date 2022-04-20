class VehicleModel {
  final String title;
  bool value;

  VehicleModel({required this.title, this.value = false});
}

final vehicle = [
  VehicleModel(title: 'Mini'),
  VehicleModel(title: 'Sedan'),
  VehicleModel(title: 'XUV')
];
