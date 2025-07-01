class QuizQuestion {
  final String question;
  final String correctAnswer;
  final List<String> answers;

  QuizQuestion({required this.question, required this.correctAnswer, required this.answers});

  List<String> getShuffleAnswers() {
    List<String> shuffledAnswers = List.from(answers);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}
