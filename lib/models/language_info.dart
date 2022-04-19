class LanguageModel {
  final String title;
  bool value;

  LanguageModel({required this.title, this.value = false});
}

final language = [
  LanguageModel(title: 'Tamil'),
  LanguageModel(title: 'English'),
  LanguageModel(title: 'Hindi')
];
