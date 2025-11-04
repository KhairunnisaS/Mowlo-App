import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/quiz_provider.dart';
import '../widgets/progress_bar.dart';
import '../widgets/option_button.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD4D4F0),
      body: SafeArea(
        child: Consumer<QuizProvider>(
          builder: (context, quizProvider, child) {
            final currentQuestion = quizProvider.currentQuestion;
            final totalQuestions = quizProvider.totalQuestions;
            final currentIndex = quizProvider.currentQuestionIndex;
            final showBackButton = currentIndex > 0; // Tampil mulai soal 2

            return LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 20.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Back Button (muncul di soal 2 dan 3)
                            if (showBackButton)
                              Align(
                                alignment: Alignment.centerLeft,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.black,
                                    size: 28,
                                  ),
                                  onPressed: () {
                                    quizProvider.previousQuestion();
                                  },
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                ),
                              ),

                            if (showBackButton) const SizedBox(height: 16),

                            // Progress Bar (Reusable Widget)
                            QuizProgressBar(
                              currentIndex: currentIndex,
                              totalQuestions: totalQuestions,
                            ),

                            const Spacer(flex: 2),

                            // Question Text
                            Flexible(
                              flex: 4,
                              child: Center(
                                child: Text(
                                  currentQuestion.text,
                                  style: const TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    height: 1.2,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),

                            const Spacer(flex: 2),

                            // Answer Options (Reusable Widget)
                            ...List.generate(
                              currentQuestion.options.length,
                                  (index) {
                                final selectedAnswer = quizProvider.getSelectedAnswer(currentIndex);
                                final isSelected = selectedAnswer == index;

                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: OptionButton(
                                    text: currentQuestion.options[index],
                                    isSelected: isSelected,
                                    onTap: () {
                                      quizProvider.selectAnswer(index);
                                    },
                                  ),
                                );
                              },
                            ),

                            const Spacer(flex: 2),

                            // Next/Submit Button
                            ElevatedButton(
                              onPressed: () {
                                if (quizProvider.hasNextQuestion) {
                                  quizProvider.nextQuestion();
                                } else {
                                  // Navigasi ke hasil quiz
                                  Navigator.pushNamed(context, '/result');
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                                padding:
                                const EdgeInsets.symmetric(vertical: 18),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 0,
                              ),
                              child: Text(
                                quizProvider.hasNextQuestion ? 'Next' : 'Submit',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}