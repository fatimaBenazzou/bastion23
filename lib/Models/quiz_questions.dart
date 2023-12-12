class QuizQuestion {
  const QuizQuestion(this.id,this.title, this.question, this.answers);


  final int id;
  final String title;
  final String question;
  final List<String> answers;

  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();

    return shuffledList;
  }
}