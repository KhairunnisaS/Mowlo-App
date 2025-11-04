import 'package:flutter/foundation.dart';
import '../models/question.dart';
import '../data/sample_questions.dart';

class QuizProvider extends ChangeNotifier {
  List<Question> _questions = [];
  int _currentQuestionIndex = 0;
  List<int?> _selectedAnswers = [];
  static const int maxScore = 950;

  QuizProvider() {
    _initQuiz();
  }

  void _initQuiz() {
    _questions = List.from(sampleQuestions);
    _selectedAnswers = List.filled(_questions.length, null);
    _currentQuestionIndex = 0;
  }

  // Getters
  Question get currentQuestion => _questions[_currentQuestionIndex];
  int get currentQuestionIndex => _currentQuestionIndex;
  int get totalQuestions => _questions.length;
  bool get hasNextQuestion => _currentQuestionIndex < _questions.length - 1;
  List<Question> get questions => _questions;
  List<int?> get selectedAnswers => _selectedAnswers;

  int get correctAnswersCount {
    int count = 0;
    for (int i = 0; i < _questions.length; i++) {
      if (_selectedAnswers[i] != null &&
          _selectedAnswers[i] == _questions[i].answerIndex) {
        count++;
      }
    }
    return count;
  }

  // Hitung score berdasarkan jawaban benar
  int get totalScore {
    if (_questions.isEmpty) return 0;
    int scorePerQuestion = maxScore ~/ _questions.length;
    return correctAnswersCount * scorePerQuestion;
  }

  // Persentase jawaban benar
  double get percentageScore {
    if (_questions.isEmpty) return 0;
    return (correctAnswersCount / _questions.length) * 100;
  }

  // Cek apakah semua soal sudah dijawab
  bool get allQuestionsAnswered {
    return !_selectedAnswers.contains(null);
  }

  // Methods
  void selectAnswer(int answerIndex) {
    _selectedAnswers[_currentQuestionIndex] = answerIndex;
    notifyListeners();
  }

  void nextQuestion() {
    if (hasNextQuestion) {
      _currentQuestionIndex++;
      notifyListeners();
    }
  }

  void previousQuestion() {
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
      notifyListeners();
    }
  }

  void resetQuiz() {
    _initQuiz();
    notifyListeners();
  }

  bool isAnswerCorrect(int questionIndex) {
    if (_selectedAnswers[questionIndex] == null) return false;
    return _selectedAnswers[questionIndex] == _questions[questionIndex].answerIndex;
  }

  int? getSelectedAnswer(int questionIndex) {
    return _selectedAnswers[questionIndex];
  }
}