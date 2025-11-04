class Question {
  final String id;
  final String text;
  final List<String> options;
  final int answerIndex;
  final String? imagePath; // optional

  Question({
    required this.id,
    required this.text,
    required this.options,
    required this.answerIndex,
    this.imagePath,
  });
}
