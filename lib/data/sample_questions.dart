import '../models/question.dart';

final List<Question> sampleQuestions = [
  Question(
    id: 'q1',
    text: 'How do frogs manage to survive both in water and on land?',
    options: [
      'They use their moist skin and lungs to take in oxygen',
      'They trap air inside their stomachs to stay underwater',
      'They can hold their breath for several hours'
    ],
    answerIndex: 0,
  ),
  Question(
    id: 'q2',
    text: 'What helps frogs escape from predators?',
    options: [
      'Their strong legs help them jump far and fast',
      'Their croaking sounds scare away other animals',
      'Their thick skin protects them from attacks'
    ],
    answerIndex: 0,
  ),
  Question(
    id: 'q3',
    text: 'Why do frogs stay close to ponds or rivers?',
    options: [
      'Their skin must stay wet to help them breathe',
      'They hunt fish that live underwater',
      'They avoid dry places during the day'
    ],
    answerIndex: 0,
  ),
];