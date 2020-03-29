import 'package:flutter/material.dart';
import 'package:jokenpo/Jogo.dart';

void main() => runApp(JokenPoApp());

class JokenPoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Jogo(title: 'JOKEN PO'),
    );
  }
}
