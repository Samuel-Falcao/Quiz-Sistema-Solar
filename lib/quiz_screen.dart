import 'dart:async';
import 'package:flutter/material.dart';
import 'result_screen.dart';
import 'question.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestion = 0;
  int score = 0;
  int seconds = 30;
  late PageController _controller;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          nextQuestion();
        }
      });
    });
  }

  void nextQuestion() {
    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
        seconds = 30;
        _controller.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      });
    } else {
      _timer?.cancel();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ResultScreen(score: score, total: questions.length),
        ),
      );
    }
  }

  void answerQuestion(bool correct) {
    if (correct) {
      score++;
    }
    nextQuestion();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: Text('Pergunta ${currentQuestion + 1} de ${questions.length}'),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: seconds / 30,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation(Colors.deepPurple),
          ),
          SizedBox(height: 8),
          Text(
            '$seconds segundos restantes',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Expanded(
            child: PageView.builder(
              controller: _controller,
              physics: NeverScrollableScrollPhysics(),
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final question = questions[index];
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/${question.image}', height: 200),
                      SizedBox(height: 20),
                      Text(
                        question.text,
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      ...question.options.map((option) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0), // Espaçamento entre botões
                          child: ElevatedButton(
                            onPressed: () => answerQuestion(option == question.answer),
                            child: Text(option),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size.fromHeight(50),
                            ),
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
