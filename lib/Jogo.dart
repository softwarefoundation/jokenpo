import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  Jogo({this.title});

  final String title;

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  static const PADRAO = "padrao.png";
  static const PAPEL = "papel.png";
  static const PEDRA = "pedra.png";
  static const TESOURA = "tesoura.png";
  static const JOGADAS = [PAPEL, PEDRA, TESOURA];
  var imagemNome = PADRAO;
  var resultadoJogada = "";
  var _jogadaApp = AssetImage("images/$PADRAO");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 16),
              child: Text(
                "Escolha do APP",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Image(image: _jogadaApp),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                resultadoJogada,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    jogada(PEDRA);
                  },
                  child: Image.asset(
                    "images/$PEDRA",
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    jogada(PAPEL);
                  },
                  child: Image.asset(
                    "images/$PAPEL",
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    jogada(TESOURA);
                  },
                  child: Image.asset(
                    "images/$TESOURA",
                    height: 100,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void jogada(String mao) {
    setState(() {
      imagemNome = JOGADAS[new Random().nextInt(JOGADAS.length)];
      _jogadaApp = AssetImage("images/$imagemNome");
      if ((mao == PEDRA)) {
        switch (imagemNome) {
          case PAPEL:
            resultadoJogada = "Você perdeu!!!";
            break;
          case TESOURA:
            resultadoJogada = "Você ganhou!!!";
            break;
          default:
            resultadoJogada = "JOKEN PO";
        }
      }

      if ((mao == PAPEL)) {
        switch (imagemNome) {
          case TESOURA:
            resultadoJogada = "Você perdeu!!!";
            break;
          case PEDRA:
            resultadoJogada = "Você ganhou!!!";
            break;
          default:
            resultadoJogada = "JOKEN PO";
        }
      }

      if (mao == TESOURA) {
        switch (imagemNome) {
          case PEDRA:
            resultadoJogada = "Você perdeu!!!";
            break;
          case PAPEL:
            resultadoJogada = "Você ganhou!!!";
            break;
          default:
            resultadoJogada = "JOKEN PO";
        }
      }
    });
  }
}
