
import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
      ),
      home: const QuizPage()
    );
  }
}

class Question {
  final String question;
  final List<String> answers;
  final int correctAnswerIndex;

  const Question({
    required this.question,
    required this.answers,
    required this.correctAnswerIndex
  });
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Question> questions = const [
    Question(
      question: 'What is the capital of Rwanda?',
      answers: ['Kigali', 'Nairobi', 'Kampala', 'Dodoma'],
      correctAnswerIndex: 0
    ),
    Question(
      question: 'Which language is used by Flutter?',
      answers: ['Java', 'Dart', 'Python', 'C#'],
      correctAnswerIndex: 1,
    ),
    Question(
      question: 'What widget stores mutable state?',
      answers: [
        'StatelessWidget',
        'Container',
        'StatefulWidget',
        'Text',
      ],
      correctAnswerIndex: 2
    ),
    Question(
      question: 'Which method rebuilds a StatefulWidget?',
      answers: [
        'setState()',
        'print()',
        'dispose()',
        'main()',
      ],
      correctAnswerIndex: 0
    ),
    Question(
      question: 'What command starts a Flutter application?',
      answers: [
        'flutter create',
        'flutter doctor',
        'flutter run',
        'flutter clean',
      ],
      correctAnswerIndex: 2
    )
  ];

  int currentQuestionIndex = 0;
  int score = 0;
  bool finished = false;

  void selectAnswer(int answerIndex) {
    final question = questions[currentQuestionIndex];

    if (answerIndex == question.correctAnswerIndex) {
      score++;
    }

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      setState(() {
        finished = true;
      });
    }
  }

  void restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
      finished = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (finished) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Quiz complete',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold
                )
              ),
              const SizedBox(height: 20),
              Text(
                '$score / ${questions.length}',
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold
                )
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: restartQuiz,
                child: const Text('Restart Quiz')
              )
            ]
          )
        )
      );
    }

    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App')
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Question ${currentQuestionIndex + 1}/${questions.length}',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.grey
            )),
            const SizedBox(height: 30),
            Text(
              currentQuestion.question,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold
              )
            ),

            const SizedBox(height: 40),

            ...currentQuestion.answers.asMap().entries.map((entry) {
              final index = entry.key;
              final answer = entry.value;

              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: ElevatedButton(
                  onPressed: () {
                    selectAnswer(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Text(
                      answer,
                      style: const TextStyle(fontSize: 18)
                    )
                  )
                )
              );
            }),
            const Spacer(),
            Text('Score: $score',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20))
          ]
        )
      )
    );

  }


}

