import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String resposta;
  final void Function() onPressedFunction;

  Resposta(this.resposta, this.onPressedFunction);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.blue),
        // ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
        child: Text(resposta),
        onPressed: onPressedFunction,
      ),
    );
  }
}
