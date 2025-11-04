class Question {
  final String id;
  final String text;
  final List<String> options;
  final int answerIndex;
  final String? imagePath; // optional untuk gambar soal

  Question({
    required this.id,
    required this.text,
    required this.options,
    required this.answerIndex,
    this.imagePath,
  }) : assert(options.isNotEmpty, 'Options cannot be empty'),
        assert(answerIndex >= 0 && answerIndex < options.length,
        'Answer index must be valid');
}