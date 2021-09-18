import 'package:flutter/material.dart';
import 'package:minicurso_flutter/tela.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Introdução ao Flutter',
      debugShowCheckedModeBanner: false,
      home: Tela(),
    );
  }
}