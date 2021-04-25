import 'package:flutter/material.dart';
import './resposta.dart';
import './questao.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    print(_perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
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

    List<Widget> respostas = [];
    for (String textResp in perguntas[_perguntaSelecionada]['resposta']) {
      respostas.add(Resposta(textResp, _responder));
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Questao(perguntas[_perguntaSelecionada]['texto']),
            ...respostas,
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
