import 'package:adv_basics/models/quiz_question.dart';

final questions = [
  QuizQuestion(
    question: 'What is the capital of France?',
    answers: const ['Berlin', 'Madrid', 'Paris', 'Rome'],
    correctAnswer: 'Paris',
  ),
  QuizQuestion(
    question: 'What is the largest planet in our solar system?',
    answers: ['Earth', 'Jupiter', 'Mars', 'Saturn'],
    correctAnswer: 'Jupiter',
  ),
  QuizQuestion(
    question: 'Who wrote "Hamlet"?',
    answers: [
      'Charles Dickens',
      'Leo Tolstoy',
      'William Shakespeare',
      'Mark Twain',
    ],
    correctAnswer: 'William Shakespeare',
  ),
  QuizQuestion(
    question: 'What is the boiling point of water?',
    answers: ['0°C', '50°C', '100°C', '150°C'],
    correctAnswer: '100°C',
  ),
  QuizQuestion(
    question: 'What is the chemical symbol for gold?',
    answers: ['Au', 'Ag', 'Fe', 'Hg'],
    correctAnswer: 'Au',
  ),
];
