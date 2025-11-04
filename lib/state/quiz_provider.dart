import 'package:flutter/material.dart';
import '../models/question.dart';
import '../data/sample_questions.dart';

class QuizProvider with ChangeNotifier {
  List<Question> _questions = sampleQuestions;
  int _current = 0;
  Map<int,int> _selected = {}; // questionIndex -> optionIndex
  bool _finished = false;

  List<Question> get questions => _questions;
  int get current => _current;
  Map<int,int> get selected => _selected;
  bool get finished => _finished;

  void selectOption(int optionIndex) {
    _selected[_current] = optionIndex;
    notifyListeners();
  }

  void next() {
    if (_current < _questions.length - 1) {
      _current++;
    } else {
      _finished = true;
    }
    notifyListeners();
  }

  void previous() {
    if (_current > 0) {
      _current--;
      notifyListeners();
    }
  }

  int calculateScore() {
    int score = 0;
    for (int i = 0; i < _questions.length; i++) {
      if (_selected[i] != null && _selected[i] == _questions[i].answerIndex) score++;
    }
    return score;
  }

  void reset() {
    _current = 0;
    _selected.clear();
    _finished = false;
    notifyListeners();
  }
}
