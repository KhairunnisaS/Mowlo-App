import 'package:flutter/material.dart';

class QuizProgressBar extends StatelessWidget {
  final int currentIndex;
  final int totalQuestions;

  const QuizProgressBar({
    super.key,
    required this.currentIndex,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: currentIndex + 1,
          child: Container(
            height: 8,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        if (currentIndex + 1 < totalQuestions)
          Expanded(
            flex: totalQuestions - (currentIndex + 1),
            child: Container(
              height: 8,
              margin: const EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
      ],
    );
  }
}