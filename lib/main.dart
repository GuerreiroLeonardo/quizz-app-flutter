import 'package:flutter/material.dart';
import './resposta.dart';
import './questao.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'resposta': ['Preto', 'Vermelho', 'Verde', 'Branco'],
    },
    {
      'texto': 'Qual é a seu animal favorito?',
      'resposta': ['Girafa', 'Leão', 'Coelho', 'Elefante'],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'resposta': ['Maria', 'João', 'Leo', 'Pedro'],
    },
  ];

  bool get hasSelectedQuestion {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder() {
    setState(() {
      if (hasSelectedQuestion) {
        _perguntaSelecionada++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = hasSelectedQuestion
        ? _perguntas[_perguntaSelecionada]['resposta']
        : null;
    // List<Widget> widgets =
    //     respostas.map((text) => Resposta(text, _responder)).toList();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
          centerTitle: true,
        ),
        body: hasSelectedQuestion
            ? Column(
                children: <Widget>[
                  Questao(_perguntas[_perguntaSelecionada]['texto']),
                  ...respostas
                      .map((text) => Resposta(text, _responder))
                      .toList(),
                ],
              )
            : null,
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
