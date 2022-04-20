class PackageModel {
  final String title;
  bool value;

  PackageModel({required this.title, this.value = false});
}

final package = [
  PackageModel(title: 'Local'),
  PackageModel(title: 'Rental'),
  PackageModel(title: 'Outstation'),
  PackageModel(title: 'Tour')
];
