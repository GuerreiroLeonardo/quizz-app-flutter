import 'package:flutter/material.dart';
import 'package:quizzapp/questionario.dart';
import 'package:quizzapp/resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _selectedQuestion = 0;
  var _totalScore = 0;
  final List<Map<String, Object>> _questions = const [
    {
      'text': 'Qual é a sua cor favorita?',
      'resposta': [
        {'text': 'Preto', 'score': 10},
        {'text': 'Vermelho', 'score': 5},
        {'text': 'Verde', 'score': 3},
        {'text': 'Branco', 'score': 1},
      ],
    },
    {
      'text': 'Qual é a seu animal favorito?',
      'resposta': [
        {'text': 'Girafa', 'score': 10},
        {'text': 'Leão', 'score': 5},
        {'text': 'Coelho', 'score': 3},
        {'text': 'Elefante', 'score': 1},
      ],
    },
    {
      'text': 'Qual é o seu instrutor favorito?',
      'resposta': [
        {'text': 'Maria', 'score': 10},
        {'text': 'João', 'score': 5},
        {'text': 'Leo', 'score': 3},
        {'text': 'Pedro', 'score': 1},
      ],
    },
  ];

  void _answer(int score) {
    setState(() {
      if (hasSelectedQuestion) {
        _selectedQuestion++;
      }
      _totalScore += score;
    });
  }

  void _restartQuizz() {
    setState(
      () {
        _selectedQuestion = 0;
        _totalScore = 0;
      },
    );
  }

  bool get hasSelectedQuestion {
    return _selectedQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    // List<Widget> widgets =
    //     respostas.map((text) => Resposta(text, _answer)).toList();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
          centerTitle: true,
        ),
        body: hasSelectedQuestion
            ? Questionario(
                perguntas: _questions,
                perguntaSelecionada: _selectedQuestion,
                onAnswer: _answer)
            : Resultado(_totalScore, _restartQuizz),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
